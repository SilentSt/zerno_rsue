import 'package:bloc/bloc.dart';
import 'package:zerno_rsue/cubit/navigation_cubit/cubit.dart';

class NavigationCubit extends Cubit<NavigationState>{
  NavigationCubit() : super(NavigationLoginState());

  NavigationState previousState = NavigationLoginState();

  void pushLoginScreen() => emit(NavigationLoginState());

  void pushRegistrationScreen() => emit(NavigationRegistrationState());

  void pushHomeScreen() => emit(NavigationHomeState());

  void pushMarketScreen() => emit(NavigationMarketState());

  void pushToPreviousScreen() => emit(previousState);


}