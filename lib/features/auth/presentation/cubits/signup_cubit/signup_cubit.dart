import 'package:bloc/bloc.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/user_entity.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.authRepo) : super(SignupInitial());
  final AuthRepo authRepo;

  Future<void> createUserWithEmailAndPassword(
    String name,
    String email,
    String password,
  ) async {
    emit(SignupLoading());
    final result = await authRepo.createUserWithEmailAndPassword(
      name,
      email,
      password,
    );
    result.fold(
      (failure) {
        emit(SignupFailure(message: failure.message));
      },
      (userEntity) {
        emit(SignupSuccess(userEntity: userEntity));
      },
    );
  }
}
