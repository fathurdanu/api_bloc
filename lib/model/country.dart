class Country {
  String name;
  List<String> topLevelDomain;
  String alpha3Code;
  List<String> callingCodes;
  String capital;
  String region;
  String subregion;
  int population;
  List<int> latlng;
  String demonym;
  List<String> timezones;
  // List<Currency> currencies;
  String flag;

  Country(
      {required this.name,
      required this.topLevelDomain,
      required this.alpha3Code,
      required this.callingCodes,
      required this.capital,
      required this.region,
      required this.subregion,
      required this.population,
      required this.latlng,
      required this.demonym,
      required this.timezones,
      // required this.currencies,
      required this.flag});

  factory Country.fromJson(Map<String, dynamic> json) {
    // print('fromJson');
    // print(((json['currencies'])[0])['name']);
    // List<Currency> currencyList =
    //     List<Currency>.from(((json['currencies'])[0])['name']);

    // print(currencyList.toString());

    return Country(
      name: json['name'],
      topLevelDomain: json['topLevelDomain'].cast<String>(),
      alpha3Code: json['alpha3Code'],
      callingCodes: json['callingCodes'].cast<String>(),
      capital: json['capital'],
      region: json['region'],
      subregion: json['subregion'],
      population: json['population'],
      latlng: json['latlng'].cast<int>(),
      demonym: json['demonym'],
      timezones: json['timezones'].cast<String>(),
      // currencies: json['currencies'].cast<Currency>(),
      flag: json['flag'],
    );
  }

  Map<String, dynamic> toJson() {
    print("toJson");
    final Map<String, dynamic> data = <String, dynamic>{};
    return <String, dynamic>{
      data['name']: name,
      data['topLevelDomain']: topLevelDomain,
      data['alpha3Code']: alpha3Code,
      data['callingCodes']: callingCodes,
      data['capital']: capital,
      data['region']: region,
      data['subregion']: subregion,
      data['population']: population,
      data['latlng']: latlng,
      data['demonym']: demonym,
      data['timezones']: timezones,
      // data['currencies']: currencies,
      data['flag']: flag
    };
  }
}

// class Currency {
//   String name;

//   Currency({required this.name});

//   factory Currency.fromJson(Map<String, dynamic> json) {
//     return Currency(name: json['name']);
//   }

//   Map<String, dynamic> toJson() {
//     return {'name': name};
//   }
// }
