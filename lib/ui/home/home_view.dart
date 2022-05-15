import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zerno_rsue/cubit/home_cubit/cubit.dart';
import 'package:zerno_rsue/cubit/navigation_cubit/cubit.dart';
import 'package:zerno_rsue/resources/app_strings.dart';
import 'package:zerno_rsue/resources/app_text_styles.dart';
import 'package:zerno_rsue/ui/widgets/app_error.dart';
import 'package:zerno_rsue/ui/widgets/tables/app_table.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _navCubit = context.read<NavigationCubit>();
    var _cubit = context.read<HomeCubit>();
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is HomeLoadedState) {
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  const SizedBox(height: 10,),
                  Text(AppStrings.selsTableTitle, style: AppTextStyles.h2.black().bold900(),),
                  const SizedBox(height: 10,),
                  SizedBox(
                    height: (MediaQuery.of(context).size.height - 167)/2,
                    child: SingleChildScrollView(
                      child: AppTable(
                        data: state.contracts.mySellContracts,
                        sell: true,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Container(width: MediaQuery.of(context).size.width, height: 1, color: Colors.black,),
                  const SizedBox(height: 10,),
                  Text(AppStrings.selsTableTitle, style: AppTextStyles.h2.black().bold900(),),
                  SizedBox(
                    height: (MediaQuery.of(context).size.height - 167)/2,
                    child: SingleChildScrollView(
                      child: AppTable(
                        data: state.contracts.myBuyContracts,
                        sell: false,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                ],
              ),
            ),
            bottomNavigationBar: BottomAppBar(
              child: SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: const ColoredBox(
                        color: Colors.black,
                        child: Center(
                          child: Text(
                            AppStrings.myDeals,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: const Center(
                        child: Text(AppStrings.market),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        if (state is HomeEmptyState) {
          _cubit.fetchContracts();
        }
        if (state is HomeErrorState) {
          return AppError(
            acceptAction: _cubit.dropState,
            text: state.error,
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
