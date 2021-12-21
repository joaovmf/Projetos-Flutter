void main(List<String> args) async {
  final controller = Controller(DioRepository());
  /* final controller = Controller(HttpRepository()); */
}

abstract class IRepository {
  void fetch();
}

class DioRepository implements IRepository {
  @override
  void fetch() {

  }
}

class HttpRepository implements IRepository {
  @override
  void fetch() {

  }
}

class Controller {
  final IRepository repository;

  Controller(this.repository);
}