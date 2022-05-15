class Balance {
  final double total;
  final int count;
  final List<OperationResultsDto> operations;

  Balance.fromJson(Map<String, dynamic> data)
      : total = double.parse(
          data['total'].toString(),
        ),
        count = data['count'],
        operations = data['operationResultsDto'] == null
            ? []
            : List.generate(
                data['operationResultsDto'].length,
                (index) => OperationResultsDto.fromJson(
                    data['operationResultsDto'][index]),
              );
}

class OperationResultsDto {
  final DateTime dateTime;
  final double? balance;

  OperationResultsDto.fromJson(Map<String, dynamic> data)
      : dateTime = data['dateTime']==null?DateTime.now():DateTime.parse(data['dateTime']),
        balance = double.parse(data['balance'].toString());
}
