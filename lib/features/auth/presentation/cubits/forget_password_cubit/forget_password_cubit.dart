import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/repos/auth_repo.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this.authRepo) : super(ForgetPasswordInitial());
  final AuthRepo authRepo;

  Future<void> sendPasswordResetEmail(String email) async {
    emit(ForgetPasswordLoading());
    final result = await authRepo.sendPasswordResetEmail(email: email);
    result.fold(
      (failure) => emit(ForgetPasswordFailure(failure.message)),
      (success) => emit(ForgetPasswordSuccess()),
    );
  }
}
