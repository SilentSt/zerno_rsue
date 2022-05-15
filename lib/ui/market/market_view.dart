import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zerno_rsue/cubit/market_cubit/cubit.dart';
import 'package:zerno_rsue/cubit/navigation_cubit/cubit.dart';
import 'package:zerno_rsue/resources/app_errors.dart';
import 'package:zerno_rsue/resources/app_strings.dart';
import 'package:zerno_rsue/resources/app_text_styles.dart';
import 'package:zerno_rsue/ui/market/widgets/new_source_dialog.dart';
import 'package:zerno_rsue/ui/widgets/app_error.dart';
import 'package:zerno_rsue/ui/widgets/tables/app_table.dart';

import '../widgets/tables/public_table.dart';

class MarketView extends StatelessWidget {
  const MarketView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _navCubit = context.read<NavigationCubit>();
    var _cubit = context.read<MarketCubit>();
    return BlocBuilder<MarketCubit, MarketState>(
      builder: (context, state) {
        if (state is MarketLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is MarketLoadedState) {
          return Scaffold(
            body: SafeArea(
              child: SizedBox(
                height: MediaQuery.of(context).size.height - 50,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        AppStrings.selsTableTitle,
                        style: AppTextStyles.h2.black().bold900(),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: (MediaQuery.of(context).size.height - 167) / 2,
                        child: SingleChildScrollView(
                          child: PublicTable(
                            data: state.publicSell,
                            sell: true,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 1,
                        color: Colors.black,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        AppStrings.buysTableTitle,
                        style: AppTextStyles.h2.black().bold900(),
                      ),
                      SizedBox(
                        height: (MediaQuery.of(context).size.height - 167) / 2,
                        child: SingleChildScrollView(
                          child: PublicTable(
                            data: state.publicBuy,
                            sell: false,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar: BottomAppBar(
              child: SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _navCubit.pushHomeScreen();
                        _cubit.dropState();
                      },
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        child: const ColoredBox(
                          color: Colors.white,
                          child: Center(
                            child: Text(
                              AppStrings.myDeals,
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _navCubit.pushMarketScreen();
                        _cubit.dropState();
                      },
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        child: const ColoredBox(
                          color: Colors.black,
                          child: Center(
                            child: Text(
                              AppStrings.market,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.black,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => const NewSourceDialog(),
                );
              },
              child: const Icon(
                Icons.add,
              ),
            ),
          );
        }
        if (state is MarketErrorState) {
          return AppError(
            acceptAction: _cubit.dropState,
            text: state.error,
          );
        }
        if (state is MarketEmptyState) {
          _cubit.fetchData();
        }
        return const SizedBox.shrink();
      },
    );
  }
}
