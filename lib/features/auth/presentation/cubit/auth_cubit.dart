import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/utils/user_prefs.dart';
import '../../data/repositories/authentication_repository.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthenticationRepository repo;

  AuthCubit(this.repo) : super(AuthInitial());

  Future<void> signup({
    required String email,
    required String password,
    required String username,
  }) async {
    emit(AuthLoading());
    try {
      final user = await repo.emailSignup(
        email: email,
        password: password,
        username: username,
      );
      emit(AuthAuthenticated(user));
    } on FirebaseAuthException catch (e) {
      emit(AuthError(e.message ?? 'Signup failed'));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());
    try {
      final user = await repo.loginWithEmail(
        email: email,
        password: password,
      );
      await UserPrefs.setLoggedIn(true);
      emit(AuthAuthenticated(user));
    } on FirebaseAuthException catch (e) {
      emit(AuthError(e.message ?? 'Login failed'));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  void reset() {
    emit(AuthInitial());
  }
}
