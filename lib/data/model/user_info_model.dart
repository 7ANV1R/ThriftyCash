import 'dart:convert';

class UserInfoModel {
  final int? localId;
  final int? id;
  final String? userId;
  final String? name;
  final String? dpUrl;
  final String? createdAt;
  final String? updatedAt;
  final int? needToSync;

  UserInfoModel({
    required this.localId,
    required this.id,
    required this.userId,
    required this.name,
    required this.dpUrl,
    required this.createdAt,
    required this.updatedAt,
    required this.needToSync,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'local_id': localId,
      'id': id,
      'user_id': userId,
      'name': name,
      'dp_url': dpUrl,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'need_to_sync': needToSync,
    };
  }

  factory UserInfoModel.fromMap(Map<String, dynamic> map) {
    return UserInfoModel(
      localId: map['local_id'] != null ? map['local_id'] as int : null,
      id: map['id'] != null ? map['id'] as int : null,
      userId: map['user_id'] != null ? map['user_id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      dpUrl: map['dp_url'] != null ? map['dp_url'] as String : null,
      createdAt: map['created_at'] != null ? map['created_at'] as String : null,
      updatedAt: map['updated_at'] != null ? map['updated_at'] as String : null,
      needToSync: map['need_to_sync'] != null ? map['need_to_sync'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserInfoModel.fromJson(String source) =>
      UserInfoModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
