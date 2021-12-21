import 'dart:math';

import 'package:clean_arch/app/auth/domain/errors/errors.dart';
import 'package:clean_arch/app/auth/domain/entities/logged_user.dart';
import 'package:clean_arch/app/auth/domain/repositories/auth_repository.dart';
import 'package:clean_arch/app/auth/infra/datasources/auth_datasource.dart';
import 'package:dartz/dartz.dart';
import 'package:clean_arch/app/auth/domain/usecases/login_usecase.dart';

class AuthRepositoryImpl implements AuthRepository {


  final AuthDatasource datasource;

  AuthRepositoryImpl(this.datasource);

  @override
  Future<Either<AuthException, LoggedUser>> login(CredentialParams params) async {
    
    try {
      final user = await datasource.login(params);
      return Right(user);
    } on AuthException catch (e) {
      return Left(e);
    } on Exception catch (e) {
      return Left(AuthException('Exception Error'));
    }
  }
}