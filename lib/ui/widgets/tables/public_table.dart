import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zerno_rsue/cubit/market_cubit/cubit.dart';
import 'package:zerno_rsue/data/models/publicrow.dart';
import 'package:zerno_rsue/data/utils.dart';

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
                      DataCell(
                        !data.data[index].contract.onTrade
                            ? IconButton(
                                onPressed: () {
                                  if(sell){
                                    context.read<MarketCubit>().deal(
                                      code: data
                                          .data[index].contract.sellerCode,
                                      count: data.data[index].count,
                                      price: data.data[index].contract.price,
                                      buy: true,
                                    );
                                  }
                                  else{
                                    context.read<MarketCubit>().deal(
                                      code: data.data[index].contract.purchaserCode,
                                      count: data.data[index].count,
                                      price: data.data[index].contract.price,
                                      buy: false,
                                    );
                                  }

                                },
                                icon: const Icon(Icons.check),
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
