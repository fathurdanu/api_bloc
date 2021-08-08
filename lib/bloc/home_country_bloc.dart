import 'package:api_bloc/bloc/home_country_event.dart';
import 'package:api_bloc/bloc/home_country_state.dart';
import 'package:api_bloc/model/country.dart';
import 'package:api_bloc/repository/country_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCountryBloc extends Bloc<HomeCountryEvent, HomeCountryState> {
  final CountryRepository countryRepository;

  HomeCountryBloc(this.countryRepository) : super(Initial());

  @override
  Stream<HomeCountryState> mapEventToState(HomeCountryEvent event) async* {
    print("7. mapEventToState");
    if (event is GetAll) {
      yield* _getAllCountry();
    }
  }

  Stream<HomeCountryState> _getAllCountry() async* {
    print("8. _getAllCountry");
    try {
      yield Loading();
      List<Country> countries = await countryRepository.fetchCountry();
      yield CountryLoaded(countries);
    } catch (e) {
      print(e);
      yield ShowMessage(e.toString());
    }
  }
}
