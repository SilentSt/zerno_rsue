import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zerno_rsue/cubit/navigation_cubit/cubit.dart';
import 'package:zerno_rsue/data/models/contract_group.dart';
import 'package:zerno_rsue/data/utils.dart';

class AppTable extends StatelessWidget {
  const AppTable({
    Key? key,
    required this.data,
  }) : super(key: key);

  final ContractGroup data;

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
                  data.priceRow.length,
                  (index) => DataRow(
                    cells: [
                      DataCell(
                        Text(
                          data.priceRow[index].contract.purchaserCode,
                        ),
                      ),
                      DataCell(
                        Text(
                          Utils.dateFormatter(
                            data.priceRow[index].contract.updated,
                          ),
                        ),
                      ),
                      DataCell(
                        Text(
                          data.priceRow[index].contract.sellerCode,
                        ),
                      ),
                      DataCell(
                        Text(
                          data.priceRow[index].count.toString(),
                        ),
                      ),
                      DataCell(
                        Text(
                          data.priceRow[index].contract.price.toString(),
                        ),
                      ),
                      DataCell(
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            (context.read<NavigationCubit>().currentPage
                                        is NavigationHomeState &&
                                    data.priceRow[index].contract.purchaserCode.length==5)
                                ? Icons.clear
                                : Icons.check,
                          ),
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
