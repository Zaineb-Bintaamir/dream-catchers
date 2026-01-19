import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  static Future<void> initialize() async {
    try {
      await dotenv.load(fileName: '.env');

      final String supabaseUrl = dotenv.env['SUPABASE_URL'] ?? '';
      final String supabaseAnonKey = dotenv.env['SUPABASE_ANON_KEY'] ?? '';

      if (supabaseUrl.isEmpty || supabaseAnonKey.isEmpty) {
        throw Exception('Supabase URL or Anon Key is missing in .env file');
      }

      await Supabase.initialize(
        url: supabaseUrl,
        anonKey: supabaseAnonKey,
      );
    } catch (e) {
      Get.log('Failed to initialize Supabase: $e');
    }
  }

  static SupabaseClient get client => Supabase.instance.client;
}
