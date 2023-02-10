import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:very_good_app/signup/repository/signup_repo.dart';
part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    on<SignupEvent>((event, emit) async{
      // TODO: implement event handler
      if(event is UserSignupEvent){
        try {
          await createUser(event);
          emit (SignupSuccess());
        } catch (e) {
          emit (SignupFailed());
        }
      }
    });
  }
}
