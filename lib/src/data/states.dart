import 'dart:convert';

CovidStates covidStatesFromJson(String str) =>
    CovidStates.fromJson(json.decode(str));

String covidStatesToJson(CovidStates data) => json.encode(data.toJson());

class CovidStates {
  CovidStates({
    this.lastUpdate,
    this.states,
  });

  DateTime? lastUpdate;
  List<State>? states;

  factory CovidStates.fromJson(Map<String, dynamic> json) => CovidStates(
        lastUpdate: DateTime.parse(json['meta']['lastUpdate']),
        states: (json['data'] as Map<String, dynamic>)
            .values
            .map((e) => State.fromJson(e))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'lastUpdate': lastUpdate.toString(),
        'states': List<dynamic>.from(states!.map((x) => x.toJson())),
      };
}

class State {
  State({
    this.name,
    this.count,
    this.weekIncidence,
    this.casesPer100K,
    this.deaths,
    this.code,
    this.hospitalization,
  });

  String? name;
  int? count;
  double? weekIncidence;
  double? casesPer100K;
  int? deaths;
  String? code;
  Hospitalization? hospitalization;

  factory State.fromJson(Map<String, dynamic> json) => State(
        name: json['name'],
        count: json['cases'],
        weekIncidence: json['weekIncidence'],
        casesPer100K: json['casesPer100k'].toDouble(),
        deaths: json['deaths'],
        code: json['abbreviation'],
        hospitalization: Hospitalization.fromJson(json['hospitalization']),
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'count': count,
        'weekIncidence': weekIncidence,
        'casesPer100k': casesPer100K,
        'deaths': deaths,
        'code': code,
        'hospitalization': hospitalization!.toJson(),
      };
}

class Hospitalization {
  Hospitalization({
    this.cases7Days,
    this.incidence7Days,
  });

  double? cases7Days;
  double? incidence7Days;

  factory Hospitalization.fromJson(Map<String, dynamic> json) =>
      Hospitalization(
        cases7Days: json['cases7Days'].toDouble(),
        incidence7Days: json['incidence7Days'].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'cases7Days': cases7Days,
        'incidence7Days': incidence7Days,
      };
}
