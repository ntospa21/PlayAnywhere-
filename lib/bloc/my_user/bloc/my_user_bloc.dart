import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
// ignore: implementation_imports
import 'package:user_repository/src/user_repository.dart';

part 'my_user_event.dart';
part 'my_user_state.dart';

class MyUserBloc extends Bloc<MyUserEvent, MyUserState> {
  final UserRepository _userRepository;

  MyUserBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(MyUserInitial()) {
    on<FetchUsername>(
      (event, emit) async {
        final username = await _userRepository.getUserData();
        emit(MyUserNameSuccess(username: username));
      },
    );
  }
}


// on<SignInRequired>((event, emit) async {
//       emit(SignInProcess());
//       try {
//         await _userRepository.signIn(event.email, event.password);
//         emit(SignInSuccess());
//       } on FirebaseAuthException catch (e) {
//         emit(SignInFailure(message: e.code));
//       } catch (e) {
//         emit(const SignInFailure());
//       }
//     });
