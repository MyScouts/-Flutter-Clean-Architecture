import 'dart:async';

import 'package:permission_handler/permission_handler.dart';

class PermissionHelper {
  static Future<bool> checkAndRequestPermission(Permission permission) async {
    Completer<bool> completer = Completer<bool>();

    final status = await permission.status;

    if (status != PermissionStatus.granted) {
      bool granted = await permission.request().isGranted;
      completer.complete(granted);
    } else {
      completer.complete(true);
    }
    return completer.future;
  }
}
