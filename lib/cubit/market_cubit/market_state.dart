import 'package:zerno_rsue/data/models/publicrow.dart';

abstract class MarketState {}

class MarketLoadingState extends MarketState {}

class MarketLoadedState extends MarketState {
  final PublicRow publicSell;
  final PublicRow publicBuy;

  MarketLoadedState({
    required this.publicSell,
    required this.publicBuy,
  });
}

class MarketEmptyState extends MarketState {}

class MarketErrorState extends MarketState {
  final String error;

  MarketErrorState(this.error);
}
