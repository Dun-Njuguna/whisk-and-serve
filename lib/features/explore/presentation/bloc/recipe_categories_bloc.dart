import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whisk_and_serve/features/explore/domain/entities/category.dart';
import 'package:whisk_and_serve/features/explore/domain/use_cases/get_recipe_categories.dart';

part 'recipe_categories_event.dart';
part 'recipe_categories_state.dart';

class RecipeCategoriesBloc
    extends Bloc<RecipeCategoriesEvent, RecipeCategoriesState> {
  final GetRecipeCategories getRecipeCategories;

  RecipeCategoriesBloc({required this.getRecipeCategories})
      : super(RecipeCategoriesInitial()) {
    on<FetchRecipeCategories>(_onFetchRecipeCategories);
  }

  Future<void> _onFetchRecipeCategories(
    FetchRecipeCategories event,
    Emitter<RecipeCategoriesState> emit,
  ) async {
    emit(RecipeCategoriesLoading());

    try {
      final categories = await getRecipeCategories.call();
      for (var item in categories) {
        print("categories.....  $item");
      }
      emit(RecipeCategoriesLoaded(categories: categories));
    } catch (e) {
      emit(RecipeCategoriesError(message: e.toString()));
    }
  }
}
