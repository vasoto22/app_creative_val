part of 'authentication_firebase_cubit.dart';

@immutable
abstract class AuthenticationState {}

class AuthenticationInitialState extends AuthenticationState {}

class AuthenticationAuthenticated extends AuthenticationState {}

class AuthenticationNotAuthenticated extends AuthenticationState {}

class AuthenticationError extends AuthenticationState {
  final String error;

  AuthenticationError(this.error);
}
