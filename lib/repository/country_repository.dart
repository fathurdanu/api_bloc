import 'dart:convert';

import 'package:api_bloc/model/country.dart';
import 'package:http/http.dart' as http;

class CountryRepository {
  Future<List<Country>> fetchCountry() async {
    print("9. fetchCountry");
    List<Country> countries = [];
    Uri urlCountry = Uri.parse("https://restcountries.eu/rest/v2/all");
    await http.get(urlCountry).then((response) {
      Iterable it = jsonDecode(response.body);
      countries = it.map((e) => Country.fromJson(e)).toList();
    });
    return countries;
  }
}
