import 'package:flutter/material.dart';
import 'package:zerno_rsue/resources/app_colors.dart';
import 'package:zerno_rsue/resources/app_text_styles.dart';


class Table extends StatefulWidget {
  const Table({Key? key}) : super(key: key);

  @override
  _TableState createState() => _TableState();
}

class _TableState extends State<Table>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("test"),

      ),
      body: Center(
        child: Column(
          children: [
            DataTable(
                columns: const [
                  DataColumn(
                      label: Text('Номер покупателя')),
                  DataColumn(
                      label: Text('Дата сделки')
                  ),
                  DataColumn(
                      label: Text('Номер продавца')
                  ),
                  DataColumn(
                      label: Text('Объем')
                  ),
                  DataColumn(
                      label: Text('Цена')
                  ),
                ],
                rows: const [
                  DataRow(cells: [
                    DataCell(Text('00'))
                  ])
                ])
          ],
        ),
      ),
    );
  }
}