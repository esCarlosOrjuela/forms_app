part of 'counter_bloc.dart';

/// clases que contienen datos del evento Counter
abstract class CounterEvent {
  const CounterEvent();
}

// Evento que notificara que el counter incremento
class IncrementEvent extends CounterEvent {
  final int valueToIncreased;

  const IncrementEvent(this.valueToIncreased);
}

class ResetEvent extends CounterEvent {}

