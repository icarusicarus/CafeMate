class Cafe {
  int? id;
  String? name, sub_name, address;
  double? lat, lon;

  Cafe({ this.id, this.name, this.sub_name, this.address, this.lat, this.lon });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'sub_name': sub_name,
      'address': address,
      'lat': lat,
      'lon': lon
    };
  }
}