import 'package:dream_catchers/core/methods/date_handlers.dart';
import 'package:dream_catchers/core/models/comment_model.dart';
import 'package:dream_catchers/core/services/supabase_service.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CommentsService {
  static final SupabaseClient _client = SupabaseService.client;
  static const String _tableName = 'comments';
  static const int _pageSize = 20;

//------------------------------CREATE COMMENT-----------------------------------

  static Future<CommentModel> createComment({
    required String postId,
    required String content,
  }) async {
    try {
      final User? user = _client.auth.currentUser;
      if (user == null) {
        throw Exception('User not authenticated');
      }

      final response = await _client.from(_tableName).insert({
        'post_id': postId,
        'user_id': user.id,
        'content': content,
      }).select('''
            *,
            User:user_id(username, email)
          ''').single();

      final Map<String, dynamic> commentJson = response;
      if (commentJson['User'] != null) {
        final userData = commentJson['User'] as Map<String, dynamic>;
        commentJson['user_name'] = userData['username'];
      }

      if (commentJson['created_at'] != null) {
        final createdAt = DateTime.parse(commentJson['created_at'] as String);
        commentJson['time_ago'] = DateHandlers.timeAgo(createdAt);
      }

      return CommentModel.fromJson(commentJson);
    } catch (e) {
      Get.log('Error creating comment: $e');
      rethrow;
    }
  }

//------------------------------GET COMMENTS (PAGINATED)-------------------------

  static Future<List<CommentModel>> getComments({
    required String postId,
    int page = 0,
  }) async {
    try {
      final int from = page * _pageSize;
      final int to = from + _pageSize - 1;

      final List<dynamic> response = await _client
          .from(_tableName)
          .select('''
            *,
            User:user_id(username, email)
          ''')
          .eq('post_id', postId)
          .order('created_at', ascending: false)
          .range(from, to);

      return response.map((json) {
        final Map<String, dynamic> commentJson = json as Map<String, dynamic>;
        if (commentJson['User'] != null) {
          final userData = commentJson['User'] as Map<String, dynamic>;
          commentJson['user_name'] = userData['username'];
        }

        if (commentJson['created_at'] != null) {
          final createdAt = DateTime.parse(commentJson['created_at'] as String);
          commentJson['time_ago'] = DateHandlers.timeAgo(createdAt);
        }

        return CommentModel.fromJson(commentJson);
      }).toList();
    } catch (e) {
      Get.log('Error getting comments: $e');
      rethrow;
    }
  }

//------------------------------UPDATE COMMENT-----------------------------------

  static Future<void> updateComment({
    required String commentId,
    required String content,
  }) async {
    try {
      final User? user = _client.auth.currentUser;
      if (user == null) {
        throw Exception('User not authenticated');
      }

      await _client
          .from(_tableName)
          .update({'content': content})
          .eq('id', commentId)
          .eq('user_id', user.id);
    } catch (e) {
      Get.log('Error updating comment: $e');
      rethrow;
    }
  }

//------------------------------DELETE COMMENT-----------------------------------

  static Future<void> deleteComment(String commentId) async {
    try {
      final User? user = _client.auth.currentUser;
      if (user == null) {
        throw Exception('User not authenticated');
      }

      await _client
          .from(_tableName)
          .delete()
          .eq('id', commentId)
          .eq('user_id', user.id);
    } catch (e) {
      Get.log('Error deleting comment: $e');
      rethrow;
    }
  }
}
