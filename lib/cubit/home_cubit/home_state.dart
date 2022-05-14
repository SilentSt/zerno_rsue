abstract class HomeState{}

class HomeLoadingState extends HomeState{}

class HomeLoadedState extends HomeState{}

class HomeErrorState extends HomeState{
  final String error;

  HomeErrorState(this.error);
}