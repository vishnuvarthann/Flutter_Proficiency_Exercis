class Location {
  String? name;
  List<Country>? country;

  Location({required this.name, required this.country});

  factory Location.fromJson(Map<String, dynamic> json) {
    final name = json['name'] as String;
    final countryData = json['country'] as List<dynamic>?;
    final country = countryData != null
        ? countryData
            .map((countryData) => Country.fromJson(countryData))
            .toList()
        : <Country>[];
    return Location(name: name, country: country);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    if (country != null) {
      data['country'] = country!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Country {
  String? countryId;
  double? probability;

  Country({required this.countryId, required this.probability});

  factory Country.fromJson(Map<String, dynamic> json) {
    final countryId = json['country_id'] as String;
    final probability = json['probability'] as double;
    return Country(countryId: countryId, probability: probability);
  }

  Map<String, dynamic> toJson() {
    return {
      'country_id': countryId,
      'probability': probability,
    };
  }
}
