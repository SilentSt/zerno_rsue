import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zerno_rsue/cubit/home_cubit/cubit.dart';
import 'package:zerno_rsue/data/models/balance.dart';
import 'package:zerno_rsue/data/models/contracts.dart';
import 'package:zerno_rsue/data/models/deal.dart';
import 'package:zerno_rsue/data/remote/api.dart';
import 'package:zerno_rsue/resources/app_errors.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeEmptyState());

  Future<void> fetchContracts() async {
    emit(HomeLoadingState());
    var res = await API.getContracts();
    if (res.statusCode > 299) {
      emit(HomeErrorState(AppErrors.baseExc));
    } else {
      String data = res.body;
      Map<String, dynamic> mappedData = json.decode(data);
      MyContracts myContracts = MyContracts.fromJson(mappedData);
      var resBal = await API.getBalance();
      if (resBal.statusCode > 299) {
        emit(HomeErrorState(AppErrors.baseExc));
      } else {
        String bData = resBal.body;
        Map<String, dynamic> bMappedData = json.decode(bData);
        Balance balance = Balance.fromJson(bMappedData);
        emit(
          HomeLoadedState(
            contracts: myContracts,
            balance: balance,
          ),
        );
      }
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
    } else {
      var res = await API.getContracts();
      if (res.statusCode > 299) {
        emit(HomeErrorState(AppErrors.wrongAuthData));
      } else {
        String data = res.body;
        Map<String, dynamic> mappedData = json.decode(data);
        MyContracts myContracts = MyContracts.fromJson(mappedData);
        var resBal = await API.getBalance();
        if (resBal.statusCode > 299) {
          emit(HomeErrorState(AppErrors.baseExc));
        } else {
          String bData = resBal.body;
          Map<String, dynamic> bMappedData = json.decode(bData);
          Balance balance = Balance.fromJson(bMappedData);
          emit(
            HomeLoadedState(
              contracts: myContracts,
              balance: balance,
            ),
          );
        }
      }
    }
  }

  Future<void> dropState() async => emit(HomeEmptyState());
}
