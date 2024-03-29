import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'collections/personal_info/personal_info_collection.dart';
import 'collections/trx_category/trx_category_collection.dart';
import 'collections/trx_model/trx_collection.dart';

late final Directory docDir;
late final Isar db;

final List<CollectionSchema> _schemas = [
  PersonalInfoSchema,
  TrxCategorySchema,
  TransactionSchema,
];

Future<Isar> initDB([String? path]) async {
  docDir = path == null ? await getApplicationDocumentsDirectory() : Directory(path);
  db = Isar.openSync(
    _schemas,
    directory: docDir.path,
    inspector: !kReleaseMode,
  );
  return db;
}
