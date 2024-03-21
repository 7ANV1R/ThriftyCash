import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'collections/trx_category_collection.dart';

late final Directory docDir;
late final Isar db;

final List<CollectionSchema> _schemas = [
  TrxCategorySchema,
];

Future<void> initDB([String? path]) async {
  docDir = path == null ? await getApplicationDocumentsDirectory() : Directory(path);
  db = Isar.openSync(
    _schemas,
    directory: docDir.path,
    inspector: !kReleaseMode,
  );
}
