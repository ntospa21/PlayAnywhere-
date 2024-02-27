import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:play_anywhere/bloc/my_user/bloc/my_user_bloc.dart';

import '../bloc/sign_in_bloc/bloc/sign_in_bloc.dart';
import '../bloc/sign_up/bloc/sign_up_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Step 1: Initialize and provide MyUserBloc
    final myUserBloc = BlocProvider.of<MyUserBloc>(context);

    // Step 2: Add FetchUsername event to trigger username retrieval
    myUserBloc.add(FetchUsername());

    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: const Text('Welcome, you are In !'),
        actions: [
          IconButton(
              onPressed: () {
                context.read<SignInBloc>().add(const SignOutRequired());
              },
              icon: const Icon(Icons.login))
        ],
      ),
      body: BlocBuilder<MyUserBloc, MyUserState>(
        builder: (context, state) {
          if (state is MyUserNameSuccess) {
            final userName = state.username; // Extract user's name
            return Column(
              children: [
                Center(
                  child: Text("Welcome, $userName"),
                ),
                ElevatedButton(
                    onPressed: () {
                      print(state);
                    },
                    child: Text("gagag"))
              ],
            );
          } else {
            return const Center(
              child: Text("Home"),
            );
          }
        },
      ),
    );
  }
}
