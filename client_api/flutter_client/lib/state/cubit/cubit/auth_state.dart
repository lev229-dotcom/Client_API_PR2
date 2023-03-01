part of 'auth_cubit.dart';

class AuthState {
  const AuthState();
}

class InitialState extends AuthState {}

class SuccessState extends AuthState {}

class ErrorState extends AuthState {
  final String message;
  ErrorState(this.message);
}
