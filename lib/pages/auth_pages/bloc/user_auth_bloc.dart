import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_auth_event.dart';
part 'user_auth_state.dart';

class UserAuthBloc extends Bloc<UserAuthEvent, UserAuthState> {
  UserAuthBloc() : super(UserAuthInitialState()) {
    on<UserAuthEvent>((event, emit) {
      print('UserAuthBloc: on<UserAuthEvent>');
      print('UserAuthBloc: event: $event');
    });
    on<UserAuthLoginEvent>((event, emit) {
      print('UserAuthBloc: on<UserAuthLoginEvent>');
      print('UserAuthBloc: event: $event');
    });
    on<UserAuthRegisterEvent>((event, emit) {
      print('UserAuthBloc: on<UserAuthRegisterEvent>');
      print('UserAuthBloc: event: $event');
    });
    on<UserAuthLogoutEvent>((event, emit) {
      print('UserAuthBloc: on<UserAuthLogoutEvent>');
      print('UserAuthBloc: event: $event');
    });
    on<UserAuthResetPasswordEvent>((event, emit) {
      print('UserAuthBloc: on<UserAuthResetPasswordEvent>');
      print('UserAuthBloc: event: $event');
    });
    on<UserAuthUpdatePasswordEvent>((event, emit) {
      print('UserAuthBloc: on<UserAuthUpdatePasswordEvent>');
      print('UserAuthBloc: event: $event');
    });
    on<UserAuthChangeIndexEvent>((event, emit) {
      print('UserAuthBloc: on<UserAuthChangeIndexEvent>');
      print('UserAuthBloc: event: $event');

      if (event.index == 0) {
        emit(const UserAuthLoginPageState());
      } else if (event.index == 1) {
        emit(const UserAuthRegisterPageState());
      }
    });
  }
}

class UserAuthFun {
  static void changeIndex(int index, BuildContext context) {
    final bloc = BlocProvider.of<UserAuthBloc>(context);
    bloc.add(UserAuthChangeIndexEvent(index: index));
  }
}
