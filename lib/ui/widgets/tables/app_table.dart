import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zerno_rsue/cubit/home_cubit/cubit.dart';
import 'package:zerno_rsue/cubit/navigation_cubit/cubit.dart';
import 'package:zerno_rsue/data/local/app_controllers.dart';
import 'package:zerno_rsue/data/models/contract_group.dart';
import 'package:zerno_rsue/data/utils.dart';
import 'package:zerno_rsue/ui/widgets/dialogs/sell_dialog.dart';

class AppTable extends StatelessWidget {
  const AppTable({
    Key? key,
    required this.data,
    required this.sell,
  }) : super(key: key);

  ///if sell = true
  ///
  /// if buy = false
  final bool sell;
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
                        ((data.priceRow[index].contract.purchaserCode.length !=
                                        5 &&
                                    sell) ||
                                (data.priceRow[index].contract.sellerCode
                                            .length !=
                                        5 &&
                                    !sell))
                            ? IconButton(
                                onPressed: () {
                                  if (context
                                      .read<NavigationCubit>()
                                      .currentPage is NavigationHomeState) {
                                    context.read<HomeCubit>().closeContract(
                                          code: data.selfCode,
                                          count: data.priceRow[index].count,
                                          price: data
                                              .priceRow[index].contract.price,
                                          buy: sell,
                                        );
                                  }
                                },
                                icon: Icon(
                                  context.read<NavigationCubit>().currentPage
                                          is NavigationHomeState
                                      ? Icons.clear
                                      : Icons.check,
                                ),
                              )
                            : !sell
                                ? IconButton(
                                    onPressed: () async {
                                      await showDialog(
                                        context: context,
                                        builder: (context) => SellDialog(
                                          data: data,
                                          index: index,
                                        ),
                                      );
                                    },
                                    icon: const Icon(
                                      Icons.arrow_forward,
                                    ),
                                  )
                                : const SizedBox.shrink(),
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
