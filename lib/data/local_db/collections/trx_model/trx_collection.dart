import 'package:isar/isar.dart';

import '../trx_category/trx_category_collection.dart';

part 'trx_collection.g.dart';

@Collection()
class Transaction {
  Id localId = Isar.autoIncrement;
  int? id;
  String? userId;
  double? amount;
  String? note;
  String? attachment;
  String? attachmentLocalPath;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? categoryID;
  final category = IsarLink<TrxCategory>();
  int? needToSync;

  Transaction({
    this.id,
    this.userId,
    this.amount = 0.0,
    this.note,
    this.attachment,
    this.attachmentLocalPath,
    this.createdAt,
    this.updatedAt,
    this.categoryID,
    this.needToSync = 1,
  });

  // from json
  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'],
      userId: json['user_id'],
      amount: dynamicToDouble(json['amount']),
      note: json['note'],
      attachment: json['attachment'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      categoryID: json['category'],
      needToSync: 0,
    );
  }
}

double dynamicToDouble(dynamic value) {
  switch (value) {
    case null:
      return 0.0;
    default:
      return double.tryParse(value.toString()) ?? 0.0;
  }
}
