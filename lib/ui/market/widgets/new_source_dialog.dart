import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zerno_rsue/cubit/market_cubit/cubit.dart';
import 'package:zerno_rsue/data/local/app_controllers.dart';
import 'package:zerno_rsue/resources/app_text_styles.dart';
import 'package:zerno_rsue/ui/widgets/text_fields/app_textfield.dart';

class NewSourceDialog extends StatelessWidget {
  const NewSourceDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool sell = false;
    return StatefulBuilder(
      builder: (context, setState) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: SingleChildScrollView(
              child: SizedBox(
                height: 320,
                width: 320,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Новый фьючерс',
                      style: AppTextStyles.h2.black().bold600(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            const Text('Продать'),
                            Checkbox(
                              value: sell,
                              onChanged: (val) {
                                setState(
                                  () {
                                    sell = val ?? false;
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const Text('Купить'),
                            Checkbox(
                              value: !sell,
                              onChanged: (val) {
                                setState(
                                  () {
                                    sell = !val!;
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    AppTextField(
                        controller: AppControllers.countContractsController,
                        label: 'Колличество'),
                    AppTextField(
                        controller: AppControllers.priceContractsController,
                        label: 'Цена за 1'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CupertinoButton(
                          child: const Text('Отмена'),
                          onPressed: () {
                            Navigator.of(context, rootNavigator: true).pop();
                          },
                        ),
                        CupertinoButton(
                          child: const Text('Выставить'),
                          onPressed: () {
                            context.read<MarketCubit>().createContract(
                                  count: int.parse(
                                    AppControllers.countContractsController.text,
                                  ),
                                  price: double.parse(
                                      AppControllers.priceContractsController.text),
                                  sell: sell,
                                );
                            Navigator.of(context, rootNavigator: true).pop();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
