part of 'category_cubit.dart';

@immutable
abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryLoadingState extends CategoryState {}
class CategorySuccessState extends CategoryState {}
class CategoryErrorState extends CategoryState {
  String error;
  CategoryErrorState({required this.error});
}


class CategoryDetailsLoadingState extends CategoryState {}
class CategoryDetailsSuccessState extends CategoryState {}
class CategoryDetailsErrorState extends CategoryState {
  String error;
  CategoryDetailsErrorState({required this.error});
}