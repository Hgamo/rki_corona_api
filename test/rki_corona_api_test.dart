import 'package:rki_corona_api/rki_corona_api.dart';
import 'package:test/test.dart';

void main() {
  test('Get cases', () async {
    var statsGermany = await RKICovidAPI.getCases();
    print('stats: ${statsGermany.deaths}');
  });

  test('Get States', () async {
    var statsGermany = await RKICovidAPI.getStates();
    for (var state in statsGermany.states!) {
      print(
          '${state.name}: cases: ${state.count} deaths: ${state.deaths} Cases per 100k: ${state.casesPer100K}');
    }
  });

  test('Get Districts', () async {
    var statsGermany = await RKICovidAPI.getDisctricts();
    for (var district in statsGermany.districts!) {
      print(
          '${district.name}: cases: ${district.count} deaths: ${district.deaths} Cases per 100k: ${district.casesPer100K}');
    }
  });
}
