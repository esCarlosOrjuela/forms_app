part of 'counter_cubit.dart';

/// => Equatable:
/// permite comparar dos objetos por sus data
/// y no por su referencia en memoria
class CounterState extends Equatable {
  final int counter;
  final int transactionCount;

  const CounterState({this.counter = 0, this.transactionCount = 0});

  copyWith({int? counter, int? transactionCount}) => CounterState(
    counter: counter ?? this.counter,
    transactionCount: transactionCount ?? this.transactionCount
  );

  // Method Equatable
  // Datos a comprar entre los objetos de tipo CounterState
  // En este caso, cada vez que invoque el estado, si no ha cambiado
  // no notifica cambios 
  @override
  List<Object> get props => [counter, transactionCount];
}
