import 'package:flutter/material.dart';
import 'package:zerno_rsue/data/models/publicrow.dart';
import 'package:zerno_rsue/data/utils.dart';
import 'package:zerno_rsue/ui/widgets/dialogs/buy_dialog.dart';

class PublicTable extends StatelessWidget {
  const PublicTable({
    Key? key,
    required this.data,
    required this.sell,
  }) : super(key: key);

  ///if sell = true
  ///
  /// if buy = false
  final bool sell;
  final PublicRow data;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            children: [
              DataTable(
                columns: const [
                  DataColumn(
                    label: Text(
                      'Номер покупателя',
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Дата сделки',
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Номер продавца',
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Объем',
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Цена',
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Действие',
                    ),
                  ),
                ],
                rows: List.generate(
                  data.data.length,
                  (index) => DataRow(
                    cells: [
                      DataCell(
                        Text(
                          data.data[index].contract.purchaserCode,
                        ),
                      ),
                      DataCell(
                        Text(
                          Utils.dateFormatter(
                            data.data[index].contract.updated,
                          ),
                        ),
                      ),
                      DataCell(
                        Text(
                          data.data[index].contract.sellerCode,
                        ),
                      ),
                      DataCell(
                        Text(
                          data.data[index].count.toString(),
                        ),
                      ),
                      DataCell(
                        Text(
                          data.data[index].contract.price.toString(),
                        ),
                      ),
                      DataCell(IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => BuyDialog(
                              data: data,
                              sell: sell,
                              index: index,
                            ),
                          );
                        },
                        icon: const Icon(Icons.arrow_back),
                      )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
