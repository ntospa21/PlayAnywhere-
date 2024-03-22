import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:play_anywhere/bloc/my_user/bloc/my_user_bloc.dart';
import 'package:play_anywhere/views/map_screen.dart';
import 'package:play_anywhere/views/widgets/PA_text.dart';

import '../bloc/sign_in_bloc/bloc/sign_in_bloc.dart';
import '../bloc/sign_up/bloc/sign_up_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myUserBloc = BlocProvider.of<MyUserBloc>(context);

    myUserBloc.add(const FetchUsername());

    return Scaffold(
      appBar: AppBar(
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
            final userName = state.username;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: PAText(
                    "Welcome $userName , let's play!",
                    style: const TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 24,
                        fontWeight: FontWeight.w200),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => const MapScreen()),
                          ),
                        );
                      },
                      title: const Text("Football"),
                      subtitle: const Text(
                          'Create a football game and invite your friends '),
                      tileColor: Colors.grey.withOpacity(0.4)),
                ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.blueAccent,
              ),
            );
          }
        },
      ),
    );
  }
}
