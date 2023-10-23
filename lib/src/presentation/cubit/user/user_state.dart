part of 'user_cubit.dart';

class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
  factory UserState.initial() => Initial();
  factory UserState.authenticated(UserModel user) => Authenticated(user);
  factory UserState.error(String message) => Error(message);
  factory UserState.authDataSavedLocally() => AuthDataSavedLocally();
}

final class UserInitial extends UserState {}

class Initial extends UserState {}

class Authenticated extends UserState {
  final UserModel user;
  Authenticated(this.user);
  @override
  List<Object> get props => [user];
}

class AuthDataSavedLocally extends UserState {}

class Error extends UserState {
  final String message;
  Error(this.message);
  @override
  List<Object> get props => [message];
}
