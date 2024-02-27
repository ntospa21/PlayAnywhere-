part of 'my_user_bloc.dart';

sealed class MyUserState extends Equatable {
  const MyUserState();

  @override
  List<Object> get props => [];
}

final class MyUserInitial extends MyUserState {}

class MyUserNameSuccess extends MyUserState {
  final String username;

  const MyUserNameSuccess({required this.username});

  factory MyUserNameSuccess.fromFunction(String Function() getUsername) {
    final username = getUsername();
    return MyUserNameSuccess(username: username);
  }

  @override
  List<Object> get props => [username];
}

class MyUserNameFailure extends MyUserState {
  final String? message;

  const MyUserNameFailure({required this.message});
}


// class SignInFailure extends SignInState {
//   final String? message;

//   const SignInFailure({this.message});
// }
