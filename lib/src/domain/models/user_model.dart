import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String uid;
  final String email;
  final String password;
  const UserModel(
      {required this.uid, required this.email, required this.password});
  @override
  List<Object> get props => [uid, email, password];
}
