import 'package:clean_arch/app/auth/domain/entities/logged_user.dart';
import 'package:clean_arch/app/auth/domain/errors/errors.dart';
import 'package:clean_arch/app/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:string_validator/string_validator.dart';

abstract class ILoginUsecase {
  Future<Either<AuthException, LoggedUser>> call(CredentialParams params);
}

class LoginUsecase implements ILoginUsecase {
  final AuthRepository repository;

  LoginUsecase(this.repository);

  @override
  Future<Either<AuthException, LoggedUser>> call(
      CredentialParams params) async {
    if (!isEmail(params.email)) {
      return Left(AuthException('Error email'));
    }

    if (params.password.isEmpty) {
      return Left(AuthException('Error password'));
    }

    return await repository.login(params);
  }
}

class CredentialParams {
  final String email;
  final String password;

  CredentialParams({required this.email, required this.password});
}

//view
/* main(List<String> args) async {
  final usecase = LoginUsecase();

  final result = await usecase();

  result.fold((l) => print('error'), (r) => print('setState'));
} */
