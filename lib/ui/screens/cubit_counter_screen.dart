import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../state_managers/cubits/counter/counter_cubit.dart';


class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => CounterCubit(), child: const _CubitCounterView());
  }
}

class _CubitCounterView extends StatelessWidget {
  const _CubitCounterView();

  @override
  Widget build(BuildContext context) {
    final counterState = context.watch<CounterCubit>().state;

    return Scaffold(
      appBar: AppBar(
        // Veamos otra forma de suscribirnos al notificado de cambios de estado CounterCubit
        title: context.select((CounterCubit value) {
          // => Validar función Equatable => 
          // print('Cambio estado');
          return Text('Cubit Counter: ${value.state.transactionCount}');
        }),
        actions: [
          IconButton(
              onPressed: () {
                context.read<CounterCubit>().reset();
              },
              icon: const Icon(Icons.refresh_outlined))
        ],
      ),
      body: Center(
        child: Text('Counter Value: ${counterState.counter}'),
      ),
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
          onPressed: () {
            context.read<CounterCubit>().increaseBy(3);
          },
        ),
        const SizedBox(height: 15),
        FloatingActionButton(
          heroTag: 2,
          child: const Text('+2'),
          onPressed: () {
            context.read<CounterCubit>().increaseBy(2);
          },
        ),
        const SizedBox(height: 15),
        FloatingActionButton(
          heroTag: 3,
          child: const Text('+1'),
          onPressed: () {
            context.read<CounterCubit>().increaseBy(1);
          },
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
