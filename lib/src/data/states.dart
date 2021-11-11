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
        states: (json['data'] as Map<String, dynamic>).values.map((e) => State.fromJson(e)).toList(),
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
  });

  String? name;
  int? count;
  double? weekIncidence;
  double? casesPer100K;
  int? deaths;
  String? code;

  factory State.fromJson(Map<String, dynamic> json) => State(
        name: json['name'],
        count: json['cases'],
        weekIncidence: json['weekIncidence'],
        casesPer100K: json['casesPer100k'].toDouble(),
        deaths: json['deaths'],
        code: json['abbreviation'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'count': count,
        'weekIncidence': weekIncidence,
        'casesPer100k': casesPer100K,
        'deaths': deaths,
        'code': code,
      };
}
