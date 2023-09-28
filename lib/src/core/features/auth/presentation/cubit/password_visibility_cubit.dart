import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'password_visibility_state.dart';

class PasswordVisibilityCubit extends Cubit<PasswordVisibilityState> {
  PasswordVisibilityCubit() : super(PasswordVisibilityInitial());

  void switchPasswordVisibility({required bool isVisible}) {
    emit(PasswordVisibilityInitial());
    emit(SwitchPasswordVisibility(isVisible: isVisible));
  }

  void switchConfirmPasswordVisibility({required bool isVisible}) {
    emit(PasswordVisibilityInitial());
    emit(SwitchConfirmPasswordVisibility(isVisible: isVisible));
  }
}
