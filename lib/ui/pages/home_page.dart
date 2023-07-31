import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../config/navigator/app_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            title: const Text('Cubits'),
            subtitle: const Text('Gestor de Estado Simple'),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () => context.push(RoutesPageApp.cubitPage),
          ),
          ListTile(
            title: const Text('BloCs'),
            subtitle: const Text('Gestor de Estado Compuesto'),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () => context.push(RoutesPageApp.blocPage),
          ),
          ListTile(
            title: const Text('Form Register'),
            subtitle: const Text('Practica Formularios'),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () => context.push(RoutesPageApp.registerPage),
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