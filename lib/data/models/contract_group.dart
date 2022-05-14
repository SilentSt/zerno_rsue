import 'contract_person.dart';

class ContractGroup {
  final String selfCode;
  final double balance;
  final int count;
  final List<ContractPerson> contractPersons;

  ContractGroup.fromJson(Map<String, dynamic> data)
      : selfCode = data['selfCode'],
        balance = data['balance'],
        count = data['count'],
        contractPersons = List.generate(
          data['contractPersons'].length,
          (index) => ContractPerson.fromJson(
            data[index],
          ),
        );
}
