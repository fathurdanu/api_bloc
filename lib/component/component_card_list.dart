import 'package:api_bloc/bloc/home_country_bloc.dart';
import 'package:api_bloc/bloc/home_country_event.dart';
import 'package:api_bloc/bloc/home_country_state.dart';
import 'package:api_bloc/repository/country_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/flutter_svg.dart'; cacat
import 'package:api_bloc/model/country.dart';

class ComponentCardList extends StatefulWidget {
  const ComponentCardList({Key? key}) : super(key: key);

  @override
  State<ComponentCardList> createState() => _ComponentCardListState();
}

class _ComponentCardListState extends State<ComponentCardList> {
  final List<Country> _countries = [];
  late HomeCountryBloc _homeCountryBloc;

  @override
  void initState() {
    print('4. initState');
    _homeCountryBloc = HomeCountryBloc(CountryRepository());
    _fetchCountries();
    super.initState();
  }

  void _fetchCountries() {
    print('5. _fetchCountries');
    _homeCountryBloc.add(GetAll());
  }

  @override
  Widget build(BuildContext context) {
    print("6. build");
    return BlocConsumer<HomeCountryBloc, HomeCountryState>(
      bloc: _homeCountryBloc,
      listener: (context, state) {
        // listener tidak butuh return sebuah widget
        //cocok untuk menampilkan message, toast, dialog, dll
        if (state is ShowMessage) {
          _showMessage(state.message);
        } else if (state is CountryLoaded) {
          print("loaded");
          _countries.clear();
          _countries.addAll(state.countries);
        }
      },
      builder: (context, state) {
        //builder wajib me-return sebuah widget
        return _createCountryList();
      },
    );
  }

  Widget _createCountryList() {
    if (_countries.isNotEmpty) {
      return Expanded(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: _countries.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: SizedBox(
                    width: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          height: 80,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.amber[200],
                            borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(20),
                            ),
                          ),
                          child: Text(
                            _countries[index].name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                          child: Text(_countries[index].capital),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                          child: Text(_countries[index].region),
                        ),
                        const SizedBox(height: 5),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 5),
              ],
            );
          },
        ),
      );
    }
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.white,
      ),
    );
  }

  void _showMessage(message) {
    AlertDialog(
      content: Text(message),
      actions: [TextButton(onPressed: () {}, child: const Text("OK"))],
    );
  }
}
