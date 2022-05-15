import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zerno_rsue/cubit/home_cubit/cubit.dart';
import 'package:zerno_rsue/data/models/contracts.dart';
import 'package:zerno_rsue/data/models/deal.dart';
import 'package:zerno_rsue/data/remote/api.dart';
import 'package:zerno_rsue/resources/app_errors.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeLoadingState());

  Future<void> fetchContracts() async {
    emit(HomeLoadingState());
    var res = await API.getContracts();
    if (res.statusCode > 299) {
      emit(HomeErrorState(AppErrors.wrongAuthData));
    }
    else {
      String data = res.body;
      Map<String, dynamic> mappedData = json.decode(data);
      MyContracts myContracts = MyContracts.fromJson(mappedData);
      emit(HomeLoadedState(myContracts));
    }
  }

  Future<void> closeContract({
    required String code,
    required int count,
    required double price,
    required bool buy,
  }) async {
    emit(HomeLoadingState());
    Deal deal = Deal(code: code, count: count, price: price, buy: buy);
    Map<String, dynamic> mappedData = deal.toJson;
    String jsonData = json.encode(mappedData);
    var closeRes = await API.postDealContracts(jsonData);
    if (closeRes.statusCode > 299) {
      emit(HomeErrorState(AppErrors.wrongAuthData));
    }
    else {
      var res = await API.getContracts();
      if (res.statusCode > 299) {
        emit(HomeErrorState(AppErrors.wrongAuthData));
      } else {
        String data = res.body;
        Map<String, dynamic> mappedData = json.decode(data);
        MyContracts myContracts = MyContracts.fromJson(mappedData);
        emit(HomeLoadedState(myContracts));
      }
    }
  }

  Future<void> dropState() async => emit(HomeLoadingState());

}