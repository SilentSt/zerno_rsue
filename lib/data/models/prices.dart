import 'package:zerno_rsue/data/models/contract.dart';

class Prices {
  final double count;
  final List<GetContract> contract;

  Prices.fromJson(Map<String, dynamic> data)
      : count = data['count'],
        contract = List.generate(
          data['prices'].length,
          (index) => GetContract.fromJson(
            data[index],
          ),
        );
}
