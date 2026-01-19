import 'package:dream_catchers/common_widgets/dialogs/custom_snackbar.dart';
import 'package:dream_catchers/core/services/supabase_service.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  static final SupabaseClient _client = SupabaseService.client;

//------------------------------GET CURRENT USER--------------------------------

  static User? get currentUser => _client.auth.currentUser;

  static bool get isAuthenticated => currentUser != null;

//------------------------------SIGN UP-----------------------------------------

  static Future<AuthResponse> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _client.auth.signUp(
        email: email,
        password: password,
        emailRedirectTo: null,
        data: {
          'email': email,
        },
      );

      if (response.user != null) {
        CustomSnackbar.show(
          status: 'success',
          title: 'Verification Email Sent',
          subtitle: 'Please check your email for verification',
        );
      }

      return response;
    } catch (e) {
      Get.log('Sign up error: $e');
      rethrow;
    }
  }

//------------------------------SIGN IN-----------------------------------------

  static Future<AuthResponse> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _client.auth.signInWithPassword(
        email: email,
        password: password,
      );

      return response;
    } catch (e) {
      Get.log('Sign in error: $e');
      rethrow;
    }
  }

//------------------------------SIGN OUT----------------------------------------

  static Future<void> signOut() async {
    try {
      await _client.auth.signOut();
    } catch (e) {
      Get.log('Sign out error: $e');
      rethrow;
    }
  }

//------------------------------SESSION LISTENER--------------------------------

  static Stream<AuthState> get authStateChanges =>
      _client.auth.onAuthStateChange;
}
