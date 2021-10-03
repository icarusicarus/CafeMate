class LocalUser {
  int? id, kind;
  String? userNumber, name, email;

  LocalUser({ this.userNumber, this.kind, this.name, this.email });

  Map<String, dynamic> toMap() {
    return {
      'user_number': userNumber,
      'kind': kind,
      'name': name,
      'email': email
    };
  }
}