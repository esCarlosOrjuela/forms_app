part of 'counter_bloc.dart';

class CounterState extends Equatable {

  final int  counter;
  final int transactionCount;

  const CounterState({this.counter = 0, this.transactionCount = 0});
  
  // Method Equatable
  // Datos a comprar entre los objetos de tipo CounterState
  // En este caso, cada vez que invoque el estado, si no ha cambiado
  // no notifica cambios 
  @override
  List<Object> get props => [counter, transactionCount];

  // Retorna una nueva instancia del CounterState
  CounterState copyWith({ int? counter, int? transactionCount}) => CounterState(
    counter: counter ?? this.counter, 
    transactionCount: transactionCount ?? this.transactionCount
  );
}
