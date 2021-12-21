import 'package:clean_arch/app/auth/domain/repositories/auth_repository.dart';
import 'package:clean_arch/app/auth/domain/usecases/login_usecase.dart';
import 'package:clean_arch/app/auth/external/firebase/firebase_auth_impl.dart';
import 'package:clean_arch/app/auth/infra/repositories/auth_repostory_impl.dart';
import 'package:kiwi/kiwi.dart';

import 'infra/datasources/auth_datasource.dart';

final container = KiwiContainer()
..registerFactory((container) => LoginUsecase(container.resolve()))
..registerFactory<AuthRepository>((container) => AuthRepositoryImpl(container.resolve()))
..registerFactory<AuthDatasource>((container) => FirebaseAuth());

main(List<String> args) {
  final usecase = container.resolve<LoginUsecase>();
}
