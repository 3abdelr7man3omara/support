import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled2/cubits/sing_in_up_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final FirebaseAuth _auth;

  AuthCubit(this._auth) : super(AuthInitial());

  Future<void> registerUser(String email, String password, String displayName) async {
    emit(AuthLoading());
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Update the user's profile with the display name
      await userCredential.user!.updateDisplayName(displayName);
      await userCredential.user!.reload(); // Reload to get the updated user info

      emit(AuthAuthenticated(userCredential.user!));
      emit(AuthRegistered());
    } catch (e) {
      emit(AuthError("Error creating user: ${e.toString()}"));
    }
  }

  Future<void> signInUser(String email, String password) async {
    emit(AuthLoading());
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(AuthAuthenticated(userCredential.user!));
    } catch (e) {
      emit(AuthError("Error signing in user: ${e.toString()}"));
    }
  }

  Future<void> signOutUser() async {
    emit(AuthLoading());
    try {
      await _auth.signOut();
      emit(AuthUnauthenticated());
    } catch (e) {
      emit(AuthError("Error signing out: ${e.toString()}"));
    }
  }
}
