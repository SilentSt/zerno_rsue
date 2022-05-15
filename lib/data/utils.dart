import 'package:zerno_rsue/data/models/contract_group.dart';
import 'package:intl/intl.dart';

class Utils {
  void getObjects(ContractGroup group) {}

  static String dateFormatter(DateTime date) {
    return DateFormat('dd.MM.yy').format(date);
  }


}
