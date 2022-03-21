abstract class IStore {
  String tableName = '';

  Future store(ip, parameter) async{}
}
