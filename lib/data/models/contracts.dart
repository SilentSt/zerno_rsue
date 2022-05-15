import 'package:zerno_rsue/data/models/contract_group.dart';

class MyContracts {
  final double balance;
  final int count;
  final ContractGroup mySellContracts;
  final ContractGroup myBuyContracts;

  MyContracts.fromJson(Map<String, dynamic> data)
      : balance = double.parse(data['balance'].toString()),
        count = data['count'],
        myBuyContracts = ContractGroup.fromJson(
          data['myBuyContracts'],
        ),
        mySellContracts = ContractGroup.fromJson(
          data['mySellContracts'],
        );
}

// class SellContracts {
//   final String selfCode;
//   final double balance;
//   final int count;
//   final List<ContractPerson> contractPersons;
//
//   SellContracts.fromJson(Map<String, dynamic> data)
//       : selfCode = data['selfCode'],
//         balance = data['balance'],
//         count = data['count'],
//         contractPersons = List.generate(
//           data['contractPersons'].length,
//           (index) => ContractPerson.fromJson(
//             data[index],
//           ),
//         );
// }
