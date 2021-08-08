import 'package:api_bloc/model/country.dart';
import 'package:equatable/equatable.dart';

abstract class HomeCountryState extends Equatable {}

class Initial implements HomeCountryState {
  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => false;
}

class Loading implements HomeCountryState {
  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => false;
}

class CountryLoaded implements HomeCountryState {
  final List<Country> countries;

  const CountryLoaded(this.countries);

  @override
  List<Object?> get props => [countries];

  @override
  bool? get stringify => true;
}

class ShowMessage implements HomeCountryState {
  final String message;

  const ShowMessage(this.message);

  @override
  List<Object?> get props => [message];

  @override
  bool? get stringify => false;
}
