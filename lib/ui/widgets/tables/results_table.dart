import 'package:flutter/material.dart';
import 'package:zerno_rsue/data/models/balance.dart';
import 'package:zerno_rsue/data/utils.dart';

class ResultsTable extends StatelessWidget {
  const ResultsTable({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Balance data;

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
                      'Дата и время начисления\nфинансового результата',
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Финансовый результат,\nруб.',
                    ),
                  ),
                ],
                rows: List.generate(
                  data.operations.length,
                  (index) => DataRow(
                    cells: [
                      DataCell(
                        Text(
                          Utils.dateFormatter(
                            data.operations[index].dateTime,
                          ),
                        ),
                      ),
                      DataCell(
                        Text(
                          data.operations[index].balance.toString(),
                        ),
                      ),
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
