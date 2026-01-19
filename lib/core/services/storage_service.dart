import 'dart:io';
import 'package:dream_catchers/core/services/supabase_service.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class StorageService {
  static final SupabaseClient _client = SupabaseService.client;

//------------------------------UPLOAD FILE--------------------------------------

  static Future<String> uploadFile({
    required String bucketName,
    required String filePath,
    required String fileName,
  }) async {
    try {
      final file = File(filePath);
      final fileBytes = await file.readAsBytes();

      await _client.storage.from(bucketName).uploadBinary(
            fileName,
            fileBytes,
            fileOptions: const FileOptions(
              upsert: true,
            ),
          );

      final String publicUrl =
          _client.storage.from(bucketName).getPublicUrl(fileName);

      return publicUrl;
    } catch (e) {
      Get.log('Error uploading file: $e');
      rethrow;
    }
  }

//------------------------------DELETE FILE---------------------------------------

  static Future<void> deleteFile({
    required String bucketName,
    required String fileName,
  }) async {
    try {
      await _client.storage.from(bucketName).remove([fileName]);
    } catch (e) {
      Get.log('Error deleting file: $e');
      rethrow;
    }
  }
}
