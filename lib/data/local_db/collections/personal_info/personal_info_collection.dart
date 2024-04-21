import 'package:isar/isar.dart';

part 'personal_info_collection.g.dart';

@Collection()
class PersonalInfo {
  Id localId = Isar.autoIncrement;
  // server id
  int? id;
  // uuid from supabase
  @Index()
  String? userID;
  String? fullName;
  String? email;
  String? dpUrl;
  String? dpLocalPath;
  DateTime? createdAt;

  PersonalInfo({
    this.id,
    this.userID,
    this.fullName,
    this.email,
    this.dpUrl,
    this.dpLocalPath,
    this.createdAt,
  });

  // from json
  factory PersonalInfo.fromJson(Map<String, dynamic> json) {
    return PersonalInfo(
      id: json['id'],
      userID: json['user_id'],
      fullName: json['full_name'],
      email: json['email'],
      dpUrl: json['dp_url'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}
