import 'package:rki_corona_api/rki_corona_api.dart';

void main() async {
  _getCases();
  _getStates();
}

void _getCases() async {
  var statsGermany = await RKICovidAPI.getCases();
  print('stats: ${statsGermany.deaths}');
}

void _getStates() async {
  var statsGermany = await RKICovidAPI.getStates();
  for (var state in statsGermany.states) {
    print(
        '${state.name}: cases: ${state.count} deaths: ${state.deaths} Cases per 100k: ${state.casesPer100K}');
  }
}
