import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/ui/state_managers/blocs/counter/counter_bloc.dart';

class BlocCounterPage extends StatelessWidget {
  const BlocCounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Asignamos un manejador de eventos a nuesta pagina
    return BlocProvider(
      create: (context) => CounterEventHandler(),
      child: const _PageView(),
    );
  }
}

class _PageView extends StatelessWidget {
  const _PageView();

  @override
  Widget build(BuildContext context) {
    final counterEventState = context.watch<CounterEventHandler>().state;

    return Scaffold(
      appBar: AppBar(
        title: Text('BloC Counter ${counterEventState.transactionCount}'),
        actions: [
          IconButton(
              onPressed: () =>
                  context.read<CounterEventHandler>().resetActionEvent(),
              icon: const Icon(Icons.refresh_outlined))
        ],
      ),
      body: Center(child: Text('BloC Value: ${counterEventState.counter}')),
      floatingActionButton: const _FloatingButton(),
    );
  }
}

class _FloatingButton extends StatelessWidget {
  const _FloatingButton();
  
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          heroTag: 1,
          child: const Text('+3'),
          onPressed: () => _onIncreaseCounterBy(context, 3),
        ),
        const SizedBox(height: 15),
        FloatingActionButton(
          heroTag: 2,
          child: const Text('+2'),
          onPressed: () => _onIncreaseCounterBy(context, 2),
        ),
        const SizedBox(height: 15),
        FloatingActionButton(
          heroTag: 3,
          child: const Text('+1'),
          onPressed: () => _onIncreaseCounterBy(context, 1),
        ),
        const SizedBox(height: 15),
      ],
    );
  }

  void _onIncreaseCounterBy(BuildContext context, int valeIncrease) {
    // Notificamos al EventHandler (Bloc) del cambio de estado en uno de sus eventos: IncrementEvent
    //context.read<CounterEventHandler>().add(IncrementEvent(valeIncrease));
    context.read<CounterEventHandler>().incrementActionEvent(valeIncrease);
  }
}
