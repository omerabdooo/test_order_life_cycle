import 'package:dartz/dartz.dart';
import 'package:test_order_life_cycle/core/errors/failure.dart';
import 'package:test_order_life_cycle/core/use_cases/param_use_case.dart';
import 'package:test_order_life_cycle/features/auth_feature/domain/entity/sign_in_entity.dart';
import 'package:test_order_life_cycle/features/auth_feature/domain/repo/auth_repo.dart';

class SignInUseCase extends UseCaseWithParam<SignInEntity, SignInParams> {
  final AuthRepo authRepo;

  SignInUseCase(this.authRepo);

  @override
  Future<Either<Failure, SignInEntity>> execute(SignInParams params) {
    return authRepo.signIn(params.phoneNumber, params.password);
  }
}

class SignInParams {
  final String phoneNumber;
  final String password;

  SignInParams(
    this.phoneNumber,
    this.password,
  );
}
