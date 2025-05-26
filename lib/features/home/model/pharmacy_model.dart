class PharmacyModel {
  final String name;
  final String dist;
  final String address;
  final String phone;
  final String loc;

  const PharmacyModel({
    required this.name,
    required this.dist,
    required this.address,
    required this.phone,
    required this.loc,
  });

  factory PharmacyModel.fromJson(Map<String, dynamic> json) {
    return PharmacyModel(
      name: json['name'],
      dist: json['dist'],
      address: json['address'],
      phone: json['phone'],
      loc: json['loc'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'dist': dist,
      'address': address,
      'phone': phone,
      'loc': loc,
    };
  }
}
