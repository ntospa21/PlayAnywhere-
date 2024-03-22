// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:play_anywhere/views/map_screen.dart';

// import '../views/home_screen.dart';
// import '../views/profile_screen.dart';


// class  AppRouter {
  


// static final _rootNavigatorKey = GlobalKey<NavigatorState>();
//   static final _shellNavigatorKey = GlobalKey<NavigatorState>();

//   static final GoRouter _router = GoRouter(
//     initialLocation: Routes.homeNamedPage,
//     debugLogDiagnostics: true,
//     navigatorKey: _rootNavigatorKey,
//     routes: [
//       ShellRoute(
//         navigatorKey: _shellNavigatorKey,
//         builder: (context, state, child) {
//           return BlocProvider(
//             create: (context) => NavigationCubit(),
//             child: MainScreen(screen: child),
//           );
//         },
//         routes: [
//           GoRoute(
//             path: Routes.homeNamedPage,
//             pageBuilder: (context, state) =>
//             const NoTransitionPage(
//               child: HomeScreen(),
//             ),
//             routes: [
//               GoRoute(
//                 path: Routes.homeDetailsNamedPage,
//                 builder: (context, state) => const HomeDetailsScreen(),
//               ),
//             ],
//           ),
//           GoRoute(
//             path: Routes.profileNamedPage,
//             pageBuilder: (context, state) =>
//             const NoTransitionPage(
//               child: ProfileScreen(),
//             ),
//             routes: [
//               GoRoute(
//                 path: Routes.profileDetailsNamedPage,
//                 builder: (context, state) => const ProfileDetailsScreen(),
//               ),
//             ],
//           ),
//           GoRoute(
//             path: Routes.settingsNamedPage,
//             pageBuilder: (context, state) =>
//             const NoTransitionPage(
//               child: SettingScreen(),
//             ),
//           ),
//         ],
//       ),
//     ],
//     errorBuilder: (context, state) => const NotFoundScreen(),

//   );

//   static GoRouter get router => _router;
// }
