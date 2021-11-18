import 'dart:convert';

import 'package:rki_corona_api/rki_corona_api.dart';

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
    this.hospitalization,
  });

  DateTime? lastUpdate;
  int? recovered;
  int? cases;
  int? deaths;
  Difference? difference;
  Hospitalization? hospitalization;

  @override
  String toString() =>
      'CovidCases(cases: $cases, deaths: $deaths, difference: $difference, lastUpdate: $lastUpdate, recovered: $recovered)';

  factory CovidCases.fromJson(Map<String, dynamic> json) => CovidCases(
        lastUpdate: DateTime.parse(json['meta']['lastUpdate']),
        recovered: json['recovered'],
        cases: json['cases'],
        deaths: json['deaths'],
        difference: Difference.fromJson(json['delta']),
        hospitalization: Hospitalization.fromJson(json['hospitalization']),
      );

  Map<String, dynamic> toJson() => {
        'lastUpdate': lastUpdate.toString(),
        'recovered': recovered,
        'cases': cases,
        'deaths': deaths,
        'difference': difference!.toJson(),
        'hospitalization': hospitalization!.toJson(),
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
