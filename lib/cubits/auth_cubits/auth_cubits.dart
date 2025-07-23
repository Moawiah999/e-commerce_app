import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/cubits/auth_cubits/auth_user_state.dart';
import 'package:online_store/models/user_model.dart';
import 'package:online_store/services/auth_user_services.dart';

class AuthUserCubit extends Cubit<AuthUserState> {
  AuthUserCubit() : super(AuthInitialState());
  late UserModel userModel;
  registration({required username, required email, required password}) async {
    try {
      userModel = await AuthUserServices(
        Dio(),
      ).registrationUser(username: username, email: email, password: password);
      emit(UserRegistrationSuccessState());
    } catch (e) {
      if (e.toString().contains('Email already in use')) {
        emit(UserExistsState());
      } else {
        emit(UserRegistrationFailedState());
      }
    }
  }

  login({required email, required password}) async {
    try {
      userModel = await AuthUserServices(
        Dio(),
      ).loginUser(email: email, password: password);

      emit(LoginSuccessState());
    } catch (e) {
      if (e.toString().contains('This user does not exist')) {
        emit(UserDoesNotExist());
      } else if (e.toString().contains('Invalid email or password')) {
        emit(UserInformationErrorState());
      } else {
        emit(LoginFailedState());
      }
    }
  }
}
