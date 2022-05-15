import 'contract_person.dart';

class ContractGroup {
  final String selfCode;
  final double balance;
  final int count;
  final List<PriceRow> priceRow;

  ContractGroup.fromJson(Map<String, dynamic> data)
      : selfCode = data['selfCode'],
        balance = double.parse(data['balance'].toString()),
        count = data['count'],
        priceRow = data['priceRow'] == null
            ? []
            : List.generate(
                data['priceRow'].length,
                (index) => PriceRow.fromJson(
                  data['priceRow'][index],
                ),
              );
}
