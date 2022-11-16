import 'package:flutter/material.dart';
import 'package:second_practical/core/db/data_base_helper.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    DataBaseHelper.instance.init();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    );
  }
}
