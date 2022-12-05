import 'package:flutter/material.dart';
import 'package:four_project/core/db/data_base_helper.dart';
import 'package:four_project/screens/signIn_screen.dart';
import 'package:four_project/screens/signUp_screen.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DataBaseHelper dataBaseHelper = DataBaseHelper.instance;
    dataBaseHelper.init();
    return const MaterialApp(
      home: SignInScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
