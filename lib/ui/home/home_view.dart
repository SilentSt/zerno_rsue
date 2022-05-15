import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zerno_rsue/cubit/home_cubit/cubit.dart';
import 'package:zerno_rsue/cubit/navigation_cubit/cubit.dart';
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
        if(state is HomeLoadingState){
          return const Center(child: CircularProgressIndicator(),);
        }
        if(state is HomeLoadedState){
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: AppTable(data: state.contracts.mySellContracts,),
              ),
            ),
          );
        }
        if(state is HomeEmptyState){
          _cubit.fetchContracts();
        }
        if(state is HomeErrorState)
          {
            return AppError(acceptAction: _cubit.dropState, text: state.error,);
          }
        return const SizedBox.shrink();
      },
    );
  }
}
