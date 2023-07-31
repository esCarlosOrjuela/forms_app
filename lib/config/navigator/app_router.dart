import 'package:forms_app/ui/pages/page.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(initialLocation: '/home', routes: [
  GoRoute(
    path: '/home',
    builder: (context, state) => const HomePage(),
  ),
  GoRoute(
    path: '/cubits',
    builder: (context, state) => const CubitCounterPage(),
  ),
  GoRoute(
    path: '/blocs',
    builder: (context, state) => const BlocCounterPage(),
  ),
  GoRoute(
    path: '/register',
    builder: (context, state) => const RegisterPage(),
  )
]);

// enum RoutesPageApp { homeScreen, cubits }

class RoutesPageApp {
  static const String homePage = '/home';
  static const String cubitPage = '/cubits';
  static const String blocPage = '/blocs';
  static const String registerPage = '/register';
}
