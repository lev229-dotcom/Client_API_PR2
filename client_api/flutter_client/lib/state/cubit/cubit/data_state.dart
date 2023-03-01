part of 'data_cubit.dart';

class DataState {
  const DataState();
}

class InitialState extends DataState {}

class SuccessState extends DataState {
  SuccessState(this.records);
  late List<FinancialRecord> records;
}

class ErrorState extends DataState {
  final String message;
  ErrorState(this.message);
}
