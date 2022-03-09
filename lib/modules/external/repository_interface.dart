import 'http_repository.dart';

final controller = HttpRepository();

abstract class IRepository {
  Future connect(String uri) async {}
}
