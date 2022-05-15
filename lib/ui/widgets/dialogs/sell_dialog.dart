import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zerno_rsue/cubit/home_cubit/home_cubit.dart';
import 'package:zerno_rsue/cubit/navigation_cubit/cubit.dart';
import 'package:zerno_rsue/data/local/app_controllers.dart';
import 'package:zerno_rsue/data/models/contract_group.dart';
import 'package:zerno_rsue/ui/widgets/text_fields/app_textfield.dart';

class SellDialog extends StatelessWidget {
  const SellDialog({Key? key, required this.data, required this.index}) : super(key: key);
  final ContractGroup data;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        height: 240,
        width: 150,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppTextField(
                  controller: AppControllers.sellCountOfContractsController,
                  label: 'Колличество'),
              AppTextField(
                  controller: AppControllers.sellPriceOfContractsController,
                  label: 'Цена'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(
                    child: const Text('Отмена'),
                    onPressed: Navigator.of(context, rootNavigator: true).pop,
                  ),
                  CupertinoButton(
                    child: const Text('Продать'),
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).pop();
                      if (context
                          .read<NavigationCubit>()
                          .currentPage is NavigationHomeState) {
                        context.read<HomeCubit>().resell(
                          code: data.priceRow[index].contract.sellerCode,
                          count: int.parse(
                            AppControllers
                                .sellCountOfContractsController
                                .text,
                          ),
                          newPrice: double.parse(
                            AppControllers
                                .sellPriceOfContractsController
                                .text,
                          ),
                          oldPrice: data.priceRow[index].contract.price,
                        );
                      }
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
