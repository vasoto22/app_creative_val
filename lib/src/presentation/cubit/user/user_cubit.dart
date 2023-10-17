import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:app_creative_val/src/domain/models/user_model.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  UserCubit() : super(UserInitial());

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = UserModel(
        uid: userCredential.user!.uid,
        email: email,
        password: password,
      );
      emit(UserState.authenticated(user));
    } on FirebaseAuthException catch (e) {
      emit(UserState.error(e.message!));
    }
  }
}
