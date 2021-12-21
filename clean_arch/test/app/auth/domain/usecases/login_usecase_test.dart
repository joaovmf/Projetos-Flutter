import 'package:clean_arch/app/auth/domain/entities/logged_user.dart';
import 'package:clean_arch/app/auth/domain/repositories/auth_repository.dart';
import 'package:clean_arch/app/auth/domain/usecases/login_usecase.dart';
import 'package:flutter_test/flutter_test.dart';

class AuthRepositoryMock implements AuthRepository {
  @override
  Future<LoggedUser> login(CredentialParams params) async {
    return LoggedUser(
      email: params.email,
      password: params.password,
    );
  }
}

void main() {
  final repository = AuthRepositoryMock();
  final usecase = LoginUsecase(repository);
  test('should effect login', () async {
    final result = usecase(
        CredentialParams(email: 'joao_vicctor@hotmail.com', password: '123'));

  expect(result, isA<LoggedUser>());
  });
}
