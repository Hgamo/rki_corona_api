import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';

import 'data/cases.dart';
import 'data/districts.dart';
import 'data/states.dart';

/// An API for accessing COVID Information for germany from the Robert-Koch-Institut.
///
/// To access COVID information you can use:
/// - `RKICovidAPI.getCases()` for nation wide infos.
/// - `RKICovidAPI.getStates()` for information about every state.
/// - `RKICovidAPI.getDisctricts()` for information about every disctrict.
///
/// You can also use `statesMapImageURL` and `disctrictsMapImageURL` to get a url for a map of the states and disctricts.
class RKICovidAPI {
  static final _baseUrl = 'thingproxy.freeboard.io/fetch/https://rki-covid-api.now.sh';
  static final _generalUrl = Uri.https(_baseUrl, '/api/general');
  static final _statesUrl = Uri.https(_baseUrl, '/api/states');
  static final _districtsUrl = Uri.https(_baseUrl, '/api/districts');

  /// The url of PNG image of the states of germany
  static const String statesMapImageURL =
      'https://thingproxy.freeboard.io/fetch/https://rki-covid-api.now.sh/api/states-map';

  /// The url of PNG image of the disctricts in germany
  static const String disctrictsMapImageURL =
      'https://thingproxy.freeboard.io/fetch/https://rki-covid-api.now.sh/api/districts-map';

  /// Get the current COVID cases of germany.
  ///
  /// Returns `null` if the api request failed.
  /// To get info about specific states and disctricts use `RKICovidAPI.getStates()` or `RKICovidAPI.getDisctricts()`.
  ///
  /// To get the current cases:
  ///```
  ///var statsGermany = await RKICovidAPI.getCases();
  ///
  ///print(statsGermany.deaths.toSring());
  ///```
  static Future<CovidCases> getCases() async {
    var resultMap = await (_responseAsMap(_generalUrl));
    return CovidCases.fromJson(resultMap as Map<String, dynamic>);
  }

  /// Get COVID information for every state in germany.
  ///
  /// Returns `null` if the api request failed.
  ///
  /// To get the current cases for every state:
  ///```
  ///  var statsGermany = await RKICovidAPI.getStates();
  ///
  ///  for (var state in statsGermany.states) {
  ///    print(
  ///       '${state.name}: cases: ${state.count} deaths: ${state.deaths} Cases per 100k: ${state.casesPer100K}');
  ///  }
  ///```
  static Future<CovidStates> getStates() async {
    var resultMap = await (_responseAsMap(_statesUrl));
    return CovidStates.fromJson(resultMap as Map<String, dynamic>);
  }

  /// Get COVID information for every district in germany.
  ///
  /// Returns `null` if the api request failed.
  ///
  /// To get the current cases for every district:
  ///```
  ///  var statsGermany = await RKICovidAPI.getDisctricts();
  ///
  ///  for (var district in statsGermany.districts) {
  ///    print(
  ///       '${district.name}: cases: ${district.count} deaths: ${district.deaths} Cases per 100k: ${district.casesPer100K}');
  ///  }
  ///```
  static Future<Districts> getDisctricts() async {
    var resultMap = await (_responseAsMap(_districtsUrl));
    return Districts.fromJson(resultMap as Map<String, dynamic>);
  }

  static Future<Map?> _responseAsMap(Uri url) async {
    var result = await get(url);
    return json.decode(result.body);
  }
}
