import 'package:flutter_demo/data/network/error_handler.dart';
import 'package:flutter_demo/data/responses/user_response.dart';
import 'package:injectable/injectable.dart';

class CacheKey {
  static const cacheListEvent = "CACHE_LIST_EVENT";
  static const cacheUser = "CACHE_USER";
}

const cacheInterval = 60 * 1000;
const userCacheInterval = cacheInterval * 60;

abstract class LocalDataSource {
  void clearCache();
  Future<void> saveUserCache(UserResponse userResponse);
  Future<UserResponse> getUser(String userId);
  void removeFromCache(String key);
}

@LazySingleton(as: LocalDataSource)
class LocalDataSourceImplementer implements LocalDataSource {
  // run time cache
  Map<String, CachedItem> cacheMap = {};

  @override
  void clearCache() {
    cacheMap.clear();
  }

  @override
  void removeFromCache(String key) {
    cacheMap.remove(key);
  }

  @override
  Future<void> saveUserCache(UserResponse userResponse) async {
    if (userResponse.uid != null && userResponse.uid!.isNotEmpty) {
      cacheMap[CacheKey.cacheUser + userResponse.uid!] =
          CachedItem(userResponse);
    }
  }

  @override
  Future<UserResponse> getUser(String userId) async {
    CachedItem? cachedItem = cacheMap[CacheKey.cacheUser + userId];

    if (cachedItem != null && cachedItem.isValid(userCacheInterval)) {
      return cachedItem.data;
    } else {
      throw ErrorHandler.handle(DataSource.cacheError);
    }
  }
}

class CachedItem {
  dynamic data;

  int cacheTime = DateTime.now().millisecondsSinceEpoch;

  CachedItem(this.data);
}

extension CachedItemExtension on CachedItem {
  bool isValid(int expirationTime) {
    int currentTimeInMillis = DateTime.now().millisecondsSinceEpoch;

    bool isCacheValid = currentTimeInMillis - expirationTime < cacheTime;

    return isCacheValid;
  }
}
