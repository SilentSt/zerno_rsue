import 'contract.dart';

class PriceRow {
  final int count;
  final String code;
  final GetContract contract;

  PriceRow.fromJson(Map<String, dynamic> data)
      : code = data['code'],
        count = data['count'],
        contract = GetContract.fromJson(
          data['contract'],
        );
}
