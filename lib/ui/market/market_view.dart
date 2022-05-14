import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zerno_rsue/cubit/market_cubit/cubit.dart';

class MarketView extends StatelessWidget {
  const MarketView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MarketCubit, MarketState>(
      builder: (context, state) {
        return const SizedBox.shrink();
      },
    );
  }
}
