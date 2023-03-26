import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'signin_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());

  static SignInCubit get(context) => BlocProvider.of(context);

  signIn({required String emailAddress, required String password}) async {
    try {
      emit(SignInLoading());

      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      emit(SignInSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(SignInFailure('No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(SignInFailure('Wrong password provided for that user.'));
      } else {
        emit(SignInFailure(e.message.toString()));
      }
    } catch (error) {
      emit(SignInFailure(error.toString()));
    }
  }
}
