import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

part 'authentication_firebase_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AuthenticationCubit() : super(AuthenticationInitialState());

  // Método para iniciar sesión con email y contraseña
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      emit(AuthenticationAuthenticated());
    } catch (e) {
      emit(AuthenticationError(e.toString()));
    }
  }

  // Método para registrarse con email y contraseña
  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      emit(AuthenticationAuthenticated());
    } catch (e) {
      emit(AuthenticationError(e.toString()));
    }
  }

  // Método para cerrar sesión
  Future<void> signOut() async {
    await _auth.signOut();
    emit(AuthenticationNotAuthenticated());
  }
}
