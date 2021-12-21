import 'package:clean_arch/app/auth/domain/entities/logged_user.dart';
import 'package:clean_arch/app/auth/domain/usecases/login_usecase.dart';

abstract class AuthDatasource {
  Future<LoggedUser> login(CredentialParams params);
}