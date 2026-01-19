import 'package:dream_catchers/core/methods/date_handlers.dart';
import 'package:dream_catchers/core/models/post_model.dart';
import 'package:dream_catchers/core/services/supabase_service.dart';
import 'package:dream_catchers/core/services/storage_service.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PostsService {
  static final SupabaseClient _client = SupabaseService.client;
  static const String _tableName = 'posts';
  static const String _likesTableName = 'post_likes';
  static const String _sharesTableName = 'post_shares';
  static const int _pageSize = 3;

//------------------------------CREATE POST---------------------------------------

  static Future<PostModel> createPost({
    String? content,
    String? mediaUrl,
    String? mediaType,
    String? title,
  }) async {
    try {
      final User? user = _client.auth.currentUser;
      if (user == null) {
        throw Exception('User not authenticated');
      }

      final Map<String, dynamic> postData = {
        'user_id': user.id,
        'content': content,
        'title': title,
        'media_url': mediaUrl,
        'media_type': mediaType,
      };

      postData.removeWhere((key, value) => value == null);

      final response =
          await _client.from(_tableName).insert(postData).select().single();

      return PostModel.fromJson(response);
    } catch (e) {
      Get.log('Error creating post: $e');
      rethrow;
    }
  }

//------------------------------UPLOAD MEDIA--------------------------------------

  static Future<String> uploadMedia({
    required String filePath,
    required String fileName,
    String? mediaType,
  }) async {
    try {
      final String url = await StorageService.uploadFile(
        bucketName: 'post-media',
        filePath: filePath,
        fileName: fileName,
      );
      return url;
    } catch (e) {
      Get.log('Error uploading media: $e');
      rethrow;
    }
  }

//------------------------------GET POSTS (PAGINATED)-----------------------------

  static Future<List<PostModel>> getPosts({
    int page = 0,
    String? sortBy,
  }) async {
    try {
      final User? user = _client.auth.currentUser;
      final String? userId = user?.id;

      dynamic query = _client.from(_tableName).select('''
            *,
            User:user_id(username, email),
            is_liked:post_likes!left(user_id)
          ''');

      if (sortBy == 'trending') {
        query = query.order('trending_score', ascending: false);
      }

      final int from = page * _pageSize;
      final int to = from + _pageSize - 1;

      query = query.range(from, to);

      final List<dynamic> response = await query;

      return response.map((json) {
        final Map<String, dynamic> postJson = json as Map<String, dynamic>;

        if (postJson['User'] != null) {
          final userData = postJson['User'] as Map<String, dynamic>;
          postJson['user_name'] = userData['username'];
        }

        if (userId != null && postJson['is_liked'] != null) {
          final likes = postJson['is_liked'] as List;
          postJson['is_liked'] = likes.any((like) => like['user_id'] == userId);
        } else {
          postJson['is_liked'] = false;
        }

        if (postJson['created_at'] != null) {
          final createdAt = DateTime.parse(postJson['created_at'] as String);
          postJson['time_ago'] = DateHandlers.timeAgo(createdAt);
        }

        return PostModel.fromJson(postJson);
      }).toList();
    } catch (e) {
      Get.log('Error getting posts: $e');
      rethrow;
    }
  }

//------------------------------LIKE POST-----------------------------------------

  static Future<void> likePost(String postId) async {
    try {
      final User? user = _client.auth.currentUser;
      if (user == null) {
        throw Exception('User not authenticated');
      }

      final existingLike = await _client
          .from(_likesTableName)
          .select()
          .eq('post_id', postId)
          .eq('user_id', user.id)
          .maybeSingle();

      if (existingLike != null) {
        await _client
            .from(_likesTableName)
            .delete()
            .eq('post_id', postId)
            .eq('user_id', user.id);
      } else {
        await _client.from(_likesTableName).insert({
          'post_id': postId,
          'user_id': user.id,
        });
      }
    } catch (e) {
      Get.log('Error liking post: $e');
      rethrow;
    }
  }

//------------------------------SHARE POST----------------------------------------

  static Future<void> sharePost(String postId) async {
    try {
      final User? user = _client.auth.currentUser;
      if (user == null) {
        throw Exception('User not authenticated');
      }

      await _client.from(_sharesTableName).insert({
        'post_id': postId,
        'user_id': user.id,
      });
    } catch (e) {
      Get.log('Error sharing post: $e');
      rethrow;
    }
  }

//------------------------------DELETE POST---------------------------------------

  static Future<void> deletePost(String postId) async {
    try {
      final User? user = _client.auth.currentUser;
      if (user == null) {
        throw Exception('User not authenticated');
      }

      await _client
          .from(_tableName)
          .delete()
          .eq('id', postId)
          .eq('user_id', user.id);
    } catch (e) {
      Get.log('Error deleting post: $e');
      rethrow;
    }
  }
}
