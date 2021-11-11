import 'dart:convert';

Districts districtsFromJson(String str) => Districts.fromJson(json.decode(str));

String districtsToJson(Districts data) => json.encode(data.toJson());

class Districts {
  Districts({
    this.lastUpdate,
    this.districts,
  });

  DateTime? lastUpdate;
  List<District>? districts;

  factory Districts.fromJson(Map<String, dynamic> json) => Districts(
        lastUpdate: DateTime.parse(json['meta']['lastUpdate']),
        districts: (json['data'] as Map<String, dynamic>)
            .values
            .map((e) => District.fromJson(e))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'lastUpdate': lastUpdate.toString(),
        'districts': List<dynamic>.from(districts!.map((x) => x.toJson())),
      };
}

class District {
  District({
    this.name,
    this.county,
    this.count,
    this.deaths,
    this.weekIncidence,
    this.casesPer100K,
    this.casesPerPopulation,
  });

  String? name;
  String? county;
  int? count;
  int? deaths;
  double? weekIncidence;
  double? casesPer100K;
  double? casesPerPopulation;

  factory District.fromJson(Map<String, dynamic> json) => District(
        name: json['name'],
        county: json['county'],
        count: json['cases'],
        deaths: json['deaths'],
        weekIncidence: json['weekIncidence'].toDouble(),
        casesPer100K: json['casesPer100k'].toDouble(),
        casesPerPopulation: json['cases'] / json['population'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'county': county,
        'count': count,
        'deaths': deaths,
        'weekIncidence': weekIncidence,
        'casesPer100k': casesPer100K,
        'casesPerPopulation': casesPerPopulation,
      };
}
