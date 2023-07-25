import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

// Registra un manejador de eventos para un evento de tipo: CounterEvent
class CounterEventHandler extends Bloc<CounterEvent, CounterState> {
  // Constructor
  CounterEventHandler() : super(const CounterState()) {
    // Handed o manejador de evento
    on<IncrementEvent>(_onCounterIncreased); 
    // igual a  => on<EventHandlerCounterIncreased>((event, emit) => _onCounterIncreased(event, emit))
    // Solo que cuando los parámetros de referencia son los mismos de entrada, se puede minimizar solo referenciado el método
    on<ResetEvent>(_onCounterReset); 
  }

  void _onCounterIncreased(IncrementEvent event, Emitter<CounterState> emit) {
    // emite o envía el mensaje de incremento hasta un receptor
    // notifica que se ha generado un evento para incrementar el estado de counter en su valor
    // event, es el evento generado, el cual entre algunos datos, tiene el valor a incrementar
    emit(state.copyWith(
        counter: state.counter + event.valueToIncreased,
        transactionCount: state.transactionCount + 1));
  }

    void _onCounterReset(ResetEvent event, Emitter<CounterState> emit) {
    // emite o envía el mensaje de incremento hasta un receptor
    // notifica que se ha generado un evento para incrementar el estado de counter en su valor
    // event, es el evento generado, el cual entre algunos datos, tiene el valor a incrementar
    emit(state.copyWith( counter: 0));
  }

  void incrementActionEvent(int value){
    add(IncrementEvent(value));
  }

  void resetActionEvent(){
    add(ResetEvent());
  }
}
