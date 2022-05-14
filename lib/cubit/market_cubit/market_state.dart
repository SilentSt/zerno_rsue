abstract class MarketState{}

class MarketLoadingState extends MarketState{}

class MarketLoadedState extends MarketState{}

class MarketErrorState extends MarketState{
  final String error;

  MarketErrorState(this.error);
}