part of 'click_cubit.dart';

@immutable
abstract class ClickState {}

class ClickInitial extends ClickState {}

class Click extends ClickState {
  int count;
  List<String> logs;

  Click(this.count, this.logs);
}
