import 'package:isar/isar.dart';
part 'trx_category_collection.g.dart';

@Collection()
class TrxCategory {
  Id localId = Isar.autoIncrement;
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
}
