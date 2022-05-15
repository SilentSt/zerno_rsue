import 'package:zerno_rsue/data/models/contracts.dart';

abstract class HomeState{}

class HomeLoadingState extends HomeState{}

class HomeLoadedState extends HomeState{
  final MyContracts contracts;

  HomeLoadedState(this.contracts);
}

class HomeErrorState extends HomeState{
  final String error;

  HomeErrorState(this.error);
}