import 'dart:developer';

import 'package:five_project/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'cubit/theme_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: state,
            home: const MyHomePage(title: 'Flutter Demo Home Page'),
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  SharedPreferences? sharedPreferences;

  Future<void> initShared() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    super.initState();
    initShared().then((value) {
      var themeData = sharedPreferences?.getBool("theme") ?? false;
      context.read<ThemeCubit>().setTheme(themeData);

      var data = sharedPreferences?.getInt("counter");

      if (data != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                Screen(count: data, sharedPreferences: sharedPreferences!),
          ),
        );
      }
    });
  }

  Future<void> _incrementCounter() async {
    setState(() {
      _counter++;
    });

    await sharedPreferences?.setInt('counter', _counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Screen(
                          count: _counter,
                          sharedPreferences: sharedPreferences!),
                    ),
                  );
                },
                child: const Text("Click")),
            FloatingActionButton(
              onPressed: () {
                context.read<ThemeCubit>().changeTheme();
                sharedPreferences?.setBool(
                    'theme', context.read<ThemeCubit>().getTheme());
              },
              tooltip: 'Theme',
              child: const Icon(Icons.sunny),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
