import 'package:zerno_rsue/data/models/prices.dart';

class ContractPerson {
  final String code;
  final List<Prices> prices;

  ContractPerson.fromJson(Map<String, dynamic> data)
      : code = data['code'],
        prices = List.generate(
          data['prices'],
          (index) => Prices.fromJson(
            data[index],
          ),
        );
}
