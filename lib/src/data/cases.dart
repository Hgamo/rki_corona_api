import 'dart:convert';

CovidCases covidCasesFromJson(String str) =>
    CovidCases.fromJson(json.decode(str));

String covidCasesToJson(CovidCases data) => json.encode(data.toJson());

class CovidCases {
  CovidCases({
    this.lastUpdate,
    this.recovered,
    this.cases,
    this.deaths,
    this.difference,
  });

  DateTime? lastUpdate;
  int? recovered;
  int? cases;
  int? deaths;
  Difference? difference;

  @override
  String toString() =>
      'CovidCases(cases: $cases, deaths: $deaths, difference: $difference, lastUpdate: $lastUpdate, recovered: $recovered)';

  factory CovidCases.fromJson(Map<String, dynamic> json) => CovidCases(
        lastUpdate: DateTime.parse(json['meta']['lastUpdate']),
        recovered: json['recovered'],
        cases: json['cases'],
        deaths: json['deaths'],
        difference: Difference.fromJson(json['delta']),
      );

  Map<String, dynamic> toJson() => {
        'lastUpdate': lastUpdate.toString(),
        'recovered': recovered,
        'cases': cases,
        'deaths': deaths,
        'difference': difference!.toJson(),
      };
}

class Difference {
  Difference({
    this.recovered,
    this.cases,
    this.deaths,
  });

  int? recovered;
  int? cases;
  int? deaths;

  factory Difference.fromJson(Map<String, dynamic> json) => Difference(
        recovered: json['recovered'],
        cases: json['cases'],
        deaths: json['deaths'],
      );

  Map<String, dynamic> toJson() => {
        'recovered': recovered,
        'cases': cases,
        'deaths': deaths,
      };
}
