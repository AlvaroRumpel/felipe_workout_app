import '../../core/utils/enums/local_storage_type_enum.dart';

export 'local_storage_service_impl.dart';

abstract interface class LocalStorageService {
  Future<void> save(LocalStorageTypeEnum type, String data);

  Future<String> get(LocalStorageTypeEnum type);
}
