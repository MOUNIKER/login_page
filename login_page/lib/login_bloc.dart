import 'package:flutter_bloc/flutter_bloc.dart';

import 'user.dart';

class LoginState  {
  final bool isLoading;
  final bool isLoggedIn;
  final bool isInCorrect;

  LoginState({required this.isLoading, required this.isLoggedIn, required this.isInCorrect});

}

abstract class LoginEvent  {}

class LoginButtonPressed extends LoginEvent {
  
  final User user;
  LoginButtonPressed({required this.user});
}

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState(isLoading: false, isLoggedIn: false, isInCorrect: false)) {
    on<LoginButtonPressed>(_onLoginButtonPressed);
  }

  void _onLoginButtonPressed(LoginButtonPressed event, Emitter<LoginState> emit) async {
    emit(LoginState(isLoading: true, isLoggedIn: false, isInCorrect: false));

    await Future.delayed(const Duration(seconds: 2));

    if (event.user.username == 'your_username' && event.user.password == 'your_password') {
      emit(LoginState(isLoading: false, isLoggedIn: true, isInCorrect: false));
    } else {
      emit(LoginState(isLoading: false, isLoggedIn: false, isInCorrect: true));
    }
  }
}
