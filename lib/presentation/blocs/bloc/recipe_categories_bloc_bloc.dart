import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'recipe_categories_bloc_event.dart';
part 'recipe_categories_bloc_state.dart';

class RecipeCategoriesBlocBloc
    extends Bloc<RecipeCategoriesBlocEvent, RecipeCategoriesBlocState> {
  RecipeCategoriesBlocBloc() : super(RecipeCategoriesBlocInitial()) {
    on<RecipeCategoriesBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
