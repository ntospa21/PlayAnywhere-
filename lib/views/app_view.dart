import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/authentication/bloc/authentication_bloc.dart';
import '../bloc/sign_in_bloc/bloc/sign_in_bloc.dart';
import '../bloc/my_user/bloc/my_user_bloc.dart'; // Import MyUserBloc
import 'home_screen.dart';
import 'welcome_screen.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Auth',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          background: Colors.white,
          onBackground: Colors.black,
          primary: Color.fromRGBO(206, 147, 216, 1),
          onPrimary: Colors.black,
          secondary: Color.fromRGBO(244, 143, 177, 1),
          onSecondary: Colors.white,
          tertiary: Color.fromRGBO(255, 204, 128, 1),
          error: Colors.red,
          outline: Color(0xFF424242),
        ),
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state.status == AuthenticationStatus.authenticated) {
            return BlocProvider(
              create: (context) => SignInBloc(
                userRepository:
                    context.read<AuthenticationBloc>().userRepository,
              ),
              child: BlocProvider(
                // Add BlocProvider for MyUserBloc
                create: (context) => MyUserBloc(
                  userRepository:
                      context.read<AuthenticationBloc>().userRepository,
                ),
                child: const HomeScreen(),
              ),
            );
          } else {
            return const WelcomeScreen();
          }
        },
      ),
    );
  }
}
