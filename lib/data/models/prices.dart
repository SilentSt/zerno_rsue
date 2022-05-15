import 'package:zerno_rsue/data/models/contract.dart';

class Prices {
  final int count;
  final GetContract contract;

  Prices.fromJson(Map<String, dynamic> data)
      : count = data['count'],
        contract = GetContract.fromJson(
          data['contract'],
        );
}
