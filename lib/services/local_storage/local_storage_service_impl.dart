import 'package:shared_preferences/shared_preferences.dart';

import '../../core/utils/enums/local_storage_type_enum.dart';
import '../../core/utils/exception.dart';
import 'local_storage_service.dart';

class LocalStorageServiceImpl implements LocalStorageService {
  Future<SharedPreferences> _instance() => SharedPreferences.getInstance();

  @override
  Future<void> save(LocalStorageTypeEnum type, String data) async {
    try {
      final i = await _instance();

      final result = await i.setString(type.name, data);

      if (!result) {
        throw LocalStorageSaveException();
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> get(LocalStorageTypeEnum type) async {
    try {
      final i = await _instance();

      final result = i.getString(type.name);

      if (result == null || result.isEmpty) {
        throw LocalStorageGetException();
      }

      return result;
    } catch (e) {
      rethrow;
    }
  }
}
