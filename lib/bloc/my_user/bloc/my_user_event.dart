part of 'my_user_bloc.dart';

abstract class MyUserEvent extends Equatable {
  const MyUserEvent();
}

class FetchUsername extends MyUserEvent {
  const FetchUsername();

  @override
  List<Object?> get props => [];
}
