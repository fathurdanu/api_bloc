import 'package:equatable/equatable.dart';

abstract class HomeCountryEvent extends Equatable {}

class GetAll implements HomeCountryEvent {
  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => false;
}
