part of 'counter_cubit.dart';

@immutable
sealed class CounterState {}

final class CounterInitial extends CounterState {}
final class Increment_SUC extends CounterState {
  final int count;

  Increment_SUC({required this.count});

}





