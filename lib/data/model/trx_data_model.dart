import 'dart:convert';

class TrxDataModel {
  final int? localId;
  final int? id;
  final String? userId;
  final int? isExpense;
  final double? amount;
  final String? note;
  final String? attachment;
  final String? attachmentLocalPath;
  final String? trxType;
  final String? createdAt;
  final String? updatedAt;
  final int? needToSync;

  TrxDataModel({
    required this.localId,
    required this.id,
    required this.userId,
    required this.isExpense,
    required this.amount,
    required this.note,
    required this.attachment,
    required this.attachmentLocalPath,
    required this.trxType,
    required this.createdAt,
    required this.updatedAt,
    required this.needToSync,
  });

  // tomap
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'local_id': localId,
      'id': id,
      'user_id': userId,
      'is_expense': isExpense,
      'amount': amount,
      'note': note,
      'attachment': attachment,
      'attachment_local_path': attachmentLocalPath,
      'trx_type': trxType,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'need_to_sync': needToSync,
    };
  }

  // frommap
  factory TrxDataModel.fromMap(Map<String, dynamic> map) {
    return TrxDataModel(
      localId: map['local_id'] != null ? map['local_id'] as int : null,
      id: map['id'] != null ? map['id'] as int : null,
      userId: map['user_id'] != null ? map['user_id'] as String : null,
      isExpense: map['is_expense'] != null ? map['is_expense'] as int : null,
      amount: map['amount'] != null ? convertAmountToDouble(map['amount']) : null,
      note: map['note'] != null ? map['note'] as String : null,
      attachment: map['attachment'] != null ? map['attachment'] as String : null,
      attachmentLocalPath:
          map['attachment_local_path'] != null ? map['attachment_local_path'] as String : null,
      trxType: map['trx_type'] != null ? map['trx_type'] as String : null,
      createdAt: map['created_at'] != null ? map['created_at'] as String : null,
      updatedAt: map['updated_at'] != null ? map['updated_at'] as String : null,
      needToSync: map['need_to_sync'] != null ? map['need_to_sync'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TrxDataModel.fromJson(String source) =>
      TrxDataModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

double convertAmountToDouble(dynamic amount) {
  if (amount is int) {
    return amount.toDouble();
  } else if (amount is double) {
    return amount;
  } else if (amount is String) {
    return double.parse(amount);
  } else {
    return 0.0;
  }
}
