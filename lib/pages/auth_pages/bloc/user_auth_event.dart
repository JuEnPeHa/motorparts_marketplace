part of 'user_auth_bloc.dart';

abstract class UserAuthEvent extends Equatable {
  const UserAuthEvent();

  @override
  List<Object> get props => [];
}

class UserAuthLoginEvent extends UserAuthEvent {
  final String email;
  final String password;
  const UserAuthLoginEvent({
    required this.email,
    required this.password,
  });
}

class UserAuthRegisterEvent extends UserAuthEvent {
  final String email;
  final String password;
  const UserAuthRegisterEvent({
    required this.email,
    required this.password,
  });
}

class UserAuthLogoutEvent extends UserAuthEvent {}

class UserAuthResetPasswordEvent extends UserAuthEvent {
  final String email;
  const UserAuthResetPasswordEvent({
    required this.email,
  });
}

class UserAuthUpdatePasswordEvent extends UserAuthEvent {
  final String password;
  const UserAuthUpdatePasswordEvent({
    required this.password,
  });
}

class UserAuthChangeIndexEvent extends UserAuthEvent {
  final int index;
  const UserAuthChangeIndexEvent({
    required this.index,
  });
}
