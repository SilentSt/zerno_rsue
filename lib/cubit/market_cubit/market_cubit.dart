import 'package:bloc/bloc.dart';
import 'package:zerno_rsue/cubit/market_cubit/cubit.dart';

class MarketCubit extends Cubit<MarketState>{
  MarketCubit() : super(MarketLoadingState());

}