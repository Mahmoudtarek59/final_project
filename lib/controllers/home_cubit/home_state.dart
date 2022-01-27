part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeDataLoadingState extends HomeState {}
class HomeDataSuccessState extends HomeState {}
class HomeDataErrorState extends HomeState {
  String error;
  HomeDataErrorState({required this.error});
}
