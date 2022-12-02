import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
part 'click_state.dart';

class ClickCubit extends Cubit<ClickState> {
  ClickCubit() : super(ClickInitial());

  int count = 0;
  bool type = true;
  List<String> logs = [];

  void increment() {
    count += type ? 1 : 2;

    logs.add("increment ${type ? 1 : 2}");
    emit(Click(count, logs));
  }

  void decrement() {
    count -= type ? 1 : 2;

    logs.add("decrement ${type ? 1 : 2}");
    emit(Click(count, logs));
  }

  void changeTheme() {
    type = !type;
    logs.add("change theme to ${type ? 'light' : 'dark'}");
    emit(Click(count, logs));
  }
}
