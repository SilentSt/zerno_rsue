import 'package:zerno_rsue/data/models/balance.dart';
import 'package:zerno_rsue/data/models/contracts.dart';

abstract class HomeState {}

class HomeLoadingState extends HomeState {}

class HomeEmptyState extends HomeState {}

class HomeLoadedState extends HomeState {
  final MyContracts contracts;
  final Balance balance;

  HomeLoadedState({
    required this.contracts,
    required this.balance,
  });
}

class HomeErrorState extends HomeState {
  final String error;

  HomeErrorState(this.error);
}
