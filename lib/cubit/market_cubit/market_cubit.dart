import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:zerno_rsue/cubit/market_cubit/cubit.dart';
import 'package:zerno_rsue/data/models/contract.dart';
import 'package:zerno_rsue/data/models/deal.dart';
import 'package:zerno_rsue/data/models/publicrow.dart';
import 'package:zerno_rsue/data/remote/api.dart';
import 'package:zerno_rsue/resources/app_errors.dart';

class MarketCubit extends Cubit<MarketState> {
  MarketCubit() : super(MarketEmptyState());

  void dropState() => emit(MarketEmptyState());

  Future<void> fetchData() async {
    emit(MarketLoadingState());
    var res = await API.getPublicBuy();
    if (res.statusCode > 299) {
      emit(MarketErrorState(AppErrors.baseExc));
    } else {
      String data = res.body;
      Map<String, dynamic> mappedData = json.decode(data);
      PublicRow publicsell = PublicRow.fromJson(mappedData);
      var resBal = await API.getPublicSell();
      if (resBal.statusCode > 299) {
        emit(MarketErrorState(AppErrors.baseExc));
      } else {
        String bData = resBal.body;
        Map<String, dynamic> bMappedData = json.decode(bData);
        PublicRow publicBuy = PublicRow.fromJson(bMappedData);
        emit(
          MarketLoadedState(
            publicSell: publicBuy,
            publicBuy: publicsell,
          ),
        );
      }
    }
  }

  Future<void> createContract({
    required int count,
    required double price,
    bool sell = true,
  }) async {
    emit(MarketLoadingState());
    PostContract contract =
        PostContract(count: count, price: price, sell: sell);
    Map<String, dynamic> mappedData = contract.toJson;
    String jsonData = json.encode(mappedData);
    var res = await API.postContracts(jsonData);
    if (res.statusCode > 299) {
      emit(MarketErrorState(AppErrors.baseExc));
    } else {
      await fetchData();
    }
  }

  Future<void> deal({
    required String code,
    required int count,
    required double price,
    required bool buy,
  }) async {
    emit(MarketLoadingState());
    Deal deal = Deal(
      code: code,
      count: count,
      price: price,
      buy: buy,
    );
    Map<String, dynamic> mappedData = deal.toJson;
    String jsonData = json.encode(mappedData);
    var res = await API.postDealContracts(jsonData);
    print(res.body);
    if (res.statusCode > 299) {
      emit(
        MarketErrorState(
          AppErrors.baseExc,
        ),
      );
    }
    else{
      fetchData();
    }
  }
}
