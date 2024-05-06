import 'package:isar/isar.dart';

part 'trx_category_collection.g.dart';

@Collection()
class TrxCategory {
  Id localId = Isar.autoIncrement;
  @Index(unique: true, replace: true)
  int? id;
  @Index()
  bool? isExpense;
  @Index()
  String? name;
  @Index()
  String? emoji;
  @Index()
  int? userServerID;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? needToSync;

  TrxCategory({
    this.id,
    this.isExpense,
    this.name,
    this.emoji,
    this.userServerID,
    this.createdAt,
    this.updatedAt,
    this.needToSync = 1,
  });

  // from json
  factory TrxCategory.fromJson(Map<String, dynamic> json) {
    return TrxCategory(
      id: json['id'],
      isExpense: json['is_expense'],
      name: json['name'],
      emoji: json['emoji'],
      userServerID: json['user_id'],
      createdAt: DateTime.parse(json['created_at']),
      needToSync: 0,
    );
  }

  // toString
  @override
  String toString() {
    return 'TrxCategory(id: $id, name: $name)';
  }
}


// {
//         "id": 1,
//         "created_at": "2024-03-13T21:27:49.166901+00:00",
//         "name": "Savings",
//         "is_expense": false,
//         "user_id": 0,
//         "emoji": "💰"
//     },