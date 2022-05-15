import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zerno_rsue/cubit/navigation_cubit/cubit.dart';
import 'package:zerno_rsue/ui/home/home_view.dart';
import 'package:zerno_rsue/ui/login/login_view.dart';
import 'package:zerno_rsue/ui/market/market_view.dart';
import 'package:zerno_rsue/ui/registration/registration_view.dart';

class AppNavigator extends StatelessWidget {
  const AppNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) => Navigator(
        pages: [
          if (state is NavigationLoginState)
            const MaterialPage(
              child: LoginView(),
            ),
          if (state is NavigationRegistrationState)
            const MaterialPage(
              child: RegistrationView(),
            ),
          if (state is NavigationMarketState)
            const MaterialPage(
              child: MarketView(),
            ),
          if (state is NavigationHomeState)
            const MaterialPage(
              child: HomeView(),
            ),
        ],
        onPopPage: (route, result) {
          return route.didPop(result);
        },
      ),
    );
  }
}
