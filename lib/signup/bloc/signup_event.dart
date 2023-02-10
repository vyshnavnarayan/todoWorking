part of 'signup_bloc.dart';

abstract class SignupEvent {
}

class UserSignupEvent extends SignupEvent{

UserSignupEvent({
  required this.name,
  required this.email,
  required this.phonenumber,
  required this.password,
});
String name;
String email;
String phonenumber;
String password;
}