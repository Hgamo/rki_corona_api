# RKI Corona API

API to access the Corona information from the Robert-Koch Institut.
This project uses the [rki-covid-api from marlon 360][api].

## Usage

After installing import the file in your project.

```dart
import 'package:rki_corona_api/rki_corona_api.dart';
```

Now you can use it:

```dart
main() async {
  var statsGermany = await RKICovidAPI.getCases();
  print('stats: ${statsGermany.deaths}');
}
```

To get details for every state use

```dart
await RKICovidAPI.getStates();
```

And To get details for every district use

```dart
await RKICovidAPI.getDisctricts();
```

## Features and bugs 🐞

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/RoundedInfinity/rki_corona_api/issues

[api]: https://github.com/marlon360/rki-covid-api
