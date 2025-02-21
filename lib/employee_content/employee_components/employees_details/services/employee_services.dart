// lib/services/storage_service.dart

import 'dart:io';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:path/path.dart' as path;

class StorageService {
  Future<String> uploadFile(File file, String type) async {
    try {
      final extension = path.extension(file.path);
      final key = '${DateTime.now().millisecondsSinceEpoch}$extension';
      final options = S3UploadFileOptions(
        accessLevel: StorageAccessLevel.private,
      );

      final result = await Amplify.Storage.uploadFile(
        local: file,
        key: '$type/$key',
        options: options,
      );

      return result.key;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> getDownloadUrl(String key) async {
    try {
      final result = await Amplify.Storage.getUrl(
        key: key,
        options: const S3GetUrlOptions(
          accessLevel: StorageAccessLevel.private,
          expires: Duration(hours: 1),
        ),
      );
      return result.url;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteFile(String key) async {
    try {
      final options = StorageRemoveOptions(
        accessLevel: StorageAccessLevel.private,
      );
      await Amplify.Storage.remove(key: key, options: options);
    } catch (e) {
      rethrow;
    }
  }
}
