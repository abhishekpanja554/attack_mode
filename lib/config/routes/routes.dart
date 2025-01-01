import 'package:attack_mode_app/features/base/presentation/screens/base_screen.dart';
import 'package:attack_mode_app/features/current_tasks/presentation/screens/current_tasks_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const BaseScreen(),
    ),
    GoRoute(
      path: CurrentTasksScreen.routeName,
      builder: (context, state) => const CurrentTasksScreen(),
    ),
  ],
);