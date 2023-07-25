import 'package:forms_app/ui/screens/page.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(initialLocation: '/home', routes: [
  GoRoute(
    path: '/home',
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: '/cubits',
    builder: (context, state) => const CubitCounterScreen(),
  ),
  GoRoute(
    path: '/blocs',
    builder: (context, state) => const BlocCounterScreen(),
  )
]);

// enum RoutesPageApp { homeScreen, cubits }

class RoutesPageApp{
  static const String homeScreen = '/home';
  static const String cubitScreen = '/cubits';
  static const String blocScreen = '/blocs';
}
