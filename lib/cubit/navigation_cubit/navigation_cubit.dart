import 'package:bloc/bloc.dart';
import 'package:zerno_rsue/cubit/navigation_cubit/cubit.dart';

class NavigationCubit extends Cubit<NavigationState>{
  NavigationCubit() : super(NavigationLoginState());

  NavigationState currentPage = NavigationLoginState();
  NavigationState previousPage = NavigationLoginState();

  void pushLoginScreen() {
    currentPage = NavigationLoginState();
    emit(NavigationLoginState());
  }

  void pushRegistrationScreen(){
    currentPage = NavigationRegistrationState();
    emit(NavigationRegistrationState());
  }

  void pushHomeScreen() {
    currentPage = NavigationHomeState();
    emit(NavigationHomeState());
  }

  void pushMarketScreen() {
    currentPage = NavigationMarketState();
    emit(NavigationMarketState());
  }

  void pushToPreviousScreen() => emit(previousPage);


}