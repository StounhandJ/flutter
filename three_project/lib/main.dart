import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:three_project/cubit/click_cubit.dart';
import 'package:three_project/cubit/theme_cubit.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: (BuildContext context) => ThemeCubit(),
        ),
        BlocProvider<ClickCubit>(
          create: (BuildContext context) => ClickCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: state,
            home: MyHomePage(),
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FF'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<ClickCubit, ClickState>(
              builder: (context, state) {
                if (state is Click) {
                  return Text(
                    state.count.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                }

                return Text(
                  "0",
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () => context.read<ClickCubit>().decrement(),
                  tooltip: 'Decrement',
                  child: const Icon(Icons.remove),
                ),
                FloatingActionButton(
                  onPressed: () => context.read<ClickCubit>().increment(),
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            FloatingActionButton(
              onPressed: () {
                context.read<ClickCubit>().changeTheme();
                context.read<ThemeCubit>().changeTheme();
              },
              tooltip: 'Theme',
              child: const Icon(Icons.sunny),
            ),
            BlocBuilder<ClickCubit, ClickState>(
              builder: (context, state) {
                List<Text> elements = [];
                if (state is Click) {
                  for (var log in state.logs) {
                    elements.add(Text(
                      log,
                    ));
                  }
                }

                return ListView(
                  shrinkWrap: true,
                  children: elements,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
