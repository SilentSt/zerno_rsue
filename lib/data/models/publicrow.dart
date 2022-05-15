import 'package:zerno_rsue/data/models/contract.dart';

class PublicRow {
  final List<Data> data;

  PublicRow.fromJson(Map<String, dynamic> data)
      : data = data['data'] == null
            ? []
            : List.generate(
                data['data'].length,
                (index) => Data.fromJson(data['data'][index]),
              );
}

class Data {
  final int count;
  final GetContract contract;

  Data.fromJson(Map<String, dynamic> data)
      : count = data['count'],
        contract = GetContract.fromJson(data['contract']);
}
