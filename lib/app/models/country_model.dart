class CountryModel {
  final int codCountry;
  final String country;
  CountryModel({required this.codCountry, required this.country});

  factory CountryModel.fromMap(Map<String, dynamic> map) {
    return CountryModel(
      country: map['Country'] ?? '',
      codCountry: map['CodCountry'] ?? 0,
    );
  }

  factory CountryModel.empty() {
    return CountryModel(codCountry: 0, country: "");
  }
}
