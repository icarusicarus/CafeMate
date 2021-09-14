class LocalUser {
  int? id, sex;
  String? userId, password, nickname, phone;

  LocalUser({ this.id, this.sex, this.userId, this.password, this.nickname, this.phone });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'password': password,
      'nickname': nickname,
      'sex': sex,
      'phone': phone
    };
  }
}