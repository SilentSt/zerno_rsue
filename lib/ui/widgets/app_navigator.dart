import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zerno_rsue/cubit/navigation_cubit/cubit.dart';

class AppNavigator extends StatelessWidget {
  const AppNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) => Navigator(
        pages: [
          if (state is NavigationLoginState)
            const MaterialPage(
              child: SizedBox(),
            ),
          if (state is NavigationRegistrationState)
            const MaterialPage(child: SizedBox()),
          if (state is NavigationMarketState)
            const MaterialPage(
              child: SizedBox(),
            ),
          if (state is NavigationHomeState)
            const MaterialPage(
              child: SizedBox(),
            ),
        ],
      ),
    );
  }
}
