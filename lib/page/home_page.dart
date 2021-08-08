import 'package:api_bloc/component/component_card_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('3. HomePage');
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [ComponentCardList()],
      ),
    );
  }
}
