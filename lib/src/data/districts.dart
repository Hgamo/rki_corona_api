import 'dart:convert';

Districts districtsFromJson(String str) => Districts.fromJson(json.decode(str));

String districtsToJson(Districts data) => json.encode(data.toJson());

class Districts {
  Districts({
    this.lastUpdate,
    this.districts,
  });

  String? lastUpdate;
  List<District>? districts;

  factory Districts.fromJson(Map<String, dynamic> json) => Districts(
        lastUpdate: json['lastUpdate'],
        districts: List<District>.from(
            json['districts'].map((x) => District.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'lastUpdate': lastUpdate,
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
        count: json['count'],
        deaths: json['deaths'],
        weekIncidence: json['weekIncidence'].toDouble(),
        casesPer100K: json['casesPer100k'].toDouble(),
        casesPerPopulation: json['casesPerPopulation'].toDouble(),
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
