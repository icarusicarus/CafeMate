class LocalUser {
  int? id, kind;
  String? userNumber, name, email;

  LocalUser({ this.id, this.userNumber, this.kind, this.name, this.email });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user_number': userNumber,
      'kind': kind,
      'name': name,
      'email': email
    };
  }
}