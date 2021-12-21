import 'package:clean_arch/app/auth/domain/usecases/login_usecase.dart';
import 'package:clean_arch/app/auth/domain/entities/logged_user.dart';
import 'package:clean_arch/app/auth/infra/datasources/auth_datasource.dart';

class AuthApi implements AuthDatasource {
  @override
  Future<LoggedUser> login(CredentialParams params) async {
    return LoggedUser(email: 'joao_vicctor@hotmail.com', password: '123');
  }
}