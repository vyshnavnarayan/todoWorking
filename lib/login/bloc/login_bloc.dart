import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:very_good_app/login/repository/login_repo.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if(event is UserLoginEvent){
      try {
          await AuthServies().userlogin(event);
          emit(LoginSuccess());
        } catch (e) {
          emit(LoginFailed());
        }
      }
    });
  }
}




