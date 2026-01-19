import 'package:dream_catchers/core/services/supabase_service.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserProfileService {
  static final SupabaseClient _client = SupabaseService.client;
  static const String _tableName = 'users';

//------------------------------SAVE USER PROFILE--------------------------------

  static Future<void> saveUserProfile({
    required String username,
    required String email,
    String? ethnicity,
    String? gender,
    String? relationshipStatus,
    DateTime? birthday,
    String? personalityType,
    String? highestEducation,
    String? userId,
  }) async {
    try {
      String? userIdToUse = userId;
      if (userIdToUse == null) {
        final User? user = _client.auth.currentUser;
        if (user != null) {
          userIdToUse = user.id;
        }
      }

      if (userIdToUse == null) {
        throw Exception('User not authenticated. Please sign in again.');
      }

      final Map<String, dynamic> profileData = {
        'id': userIdToUse,
        'username': username,
        'email': email,
        'ethnicity': ethnicity,
        'gender': gender,
        'relationship_status': relationshipStatus,
        'birthday': birthday?.toIso8601String(),
        'personality_ie': 'I',
        'highest_education_level': highestEducation,
      };
      profileData.removeWhere((key, value) => value == null);
      await _client.from(_tableName).insert(profileData);
    } catch (e) {
      Get.log('Error saving user profile: $e');
      rethrow;
    }
  }

//------------------------------GET USER PROFILE---------------------------------

  static Future<Map<String, dynamic>?> getUserProfile() async {
    try {
      final User? user = _client.auth.currentUser;
      if (user == null) {
        return null;
      }

      final response =
          await _client.from(_tableName).select().eq('id', user.id).single();

      return response as Map<String, dynamic>?;
    } catch (e) {
      Get.log('Error getting user profile: $e');
      return null;
    }
  }
}
