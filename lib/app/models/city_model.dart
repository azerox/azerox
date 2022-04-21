class CityModel {
  final int codeState;
  final int codeCity;
  final String city;
  CityModel({this.codeCity = 0, this.codeState = 0, this.city = ""});

  factory CityModel.fromMap(Map<String, dynamic> map) {
    return CityModel(
      codeState: map['CodState'] ?? '',
      codeCity: map['CodCity'] ?? '',
      city: map['City'] ?? '',
    );
  }
}
