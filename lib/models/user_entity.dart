
class UserEntity {
  int id;
  String email;
  String role;


  UserEntity({
    this.id,
    this.email,
    this.role,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json){
    return UserEntity(
      id: json['userId'] ?? 0,
      email: json['mail'] ?? "",
      role: json['role'] ?? "",
    );
  }

  static List<UserEntity> fromJSONList(List<dynamic> jsonlist){
    List<UserEntity> items = List<UserEntity>();
    jsonlist.forEach((dynamic json) { 
      items.add(UserEntity.fromJson(json));
    });
    return items;
  }
}

