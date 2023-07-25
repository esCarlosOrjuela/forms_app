import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../config/navigator/app_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            title: const Text('Cubits'),
            subtitle: const Text('Gestor de Estado Simple'),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () => context.push(RoutesPageApp.cubitScreen),
          ),
          ListTile(
            title: const Text('BloCs'),
            subtitle: const Text('Gestor de Estado Compuesto'),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () => context.push(RoutesPageApp.blocScreen),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Divider(),
          ),
        ],
      ),
    );
  }
}