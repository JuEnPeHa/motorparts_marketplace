part of 'user_auth_bloc.dart';

abstract class UserAuthState extends Equatable {
  final int index;
  const UserAuthState({
    required this.index,
  });

  @override
  List<Object> get props => [index];
}

class UserAuthInitialState extends UserAuthState {
  const UserAuthInitialState() : super(index: 0);
}

class UserAuthLoginPageState extends UserAuthState {
  const UserAuthLoginPageState() : super(index: 0);
}

class UserAuthRegisterPageState extends UserAuthState {
  const UserAuthRegisterPageState() : super(index: 1);
}
