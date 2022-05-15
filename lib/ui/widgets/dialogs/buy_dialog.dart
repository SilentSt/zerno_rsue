import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zerno_rsue/cubit/market_cubit/cubit.dart';
import 'package:zerno_rsue/data/local/app_controllers.dart';
import 'package:zerno_rsue/data/models/publicrow.dart';
import 'package:zerno_rsue/ui/widgets/text_fields/app_textfield.dart';

class BuyDialog extends StatelessWidget {
  const BuyDialog({Key? key, required this.data, required this.sell, required this.index}) : super(key: key);
  final bool sell;
  final PublicRow data;
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
                  controller: AppControllers.buyCountOfContractsController,
                  label: 'Колличество'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(
                    child: const Text('Отмена'),
                    onPressed: Navigator.of(context, rootNavigator: true).pop,
                  ),
                  CupertinoButton(
                    child: const Text('Купить'),
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).pop();
                      if (sell) {
                        if (data.data[index].contract.purchaserCode
                            .isNotEmpty &&
                            data.data[index].contract.sellerCode
                                .isNotEmpty) {
                          context.read<MarketCubit>().redeal(
                            bayerCode:
                            data.data[index].contract.purchaserCode,
                            count: int.parse(AppControllers.buyCountOfContractsController.text),
                            price: data.data[index].contract.price,
                            sellerCode:
                            data.data[index].contract.sellerCode,
                          );
                        } else {
                          context.read<MarketCubit>().deal(
                            code: data.data[index].contract.sellerCode,
                            count: int.parse(AppControllers.buyCountOfContractsController.text),
                            price: data.data[index].contract.price,
                            buy: true,
                          );
                        }
                      } else {
                        context.read<MarketCubit>().deal(
                          code: data.data[index].contract.purchaserCode,
                          count: int.parse(AppControllers.buyCountOfContractsController.text),
                          price: data.data[index].contract.price,
                          buy: false,
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
