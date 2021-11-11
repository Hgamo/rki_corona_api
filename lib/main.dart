import './rki_corona_api.dart';

void main() async {
  final districts = await RKICovidAPI.getCases();
  print(districts);
}
