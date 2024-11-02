import 'package:dartz/dartz.dart';
import 'package:test_order_life_cycle/core/errors/failure.dart';
import 'package:test_order_life_cycle/features/auth_feature/domain/entity/sign_in_entity.dart';


abstract class AuthRepo {
  Future<Either<Failure, SignInEntity>> signIn(
      String phoneNumber, String password);

}
