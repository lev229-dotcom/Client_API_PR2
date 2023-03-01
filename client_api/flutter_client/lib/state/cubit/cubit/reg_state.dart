part of 'reg_cubit.dart';


class RegState {
  const RegState();
}

class InitialState extends RegState {}

class SuccessState extends RegState {}

class ErrorState extends RegState {
  final String message;
  ErrorState(this.message);
}
