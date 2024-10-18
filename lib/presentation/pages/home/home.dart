import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whisk_and_serve/presentation/blocs/bloc/recipe_categories_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    // Trigger the event to fetch recipe categories when the widget is initialized
    context.read<RecipeCategoriesBloc>().add(FetchRecipeCategories());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipe Categories'),
      ),
      body: BlocBuilder<RecipeCategoriesBloc, RecipeCategoriesState>(
        builder: (context, state) {
          if (state is RecipeCategoriesLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is RecipeCategoriesLoaded) {
            return ListView.builder(
              itemCount: state.categories.length,
              itemBuilder: (context, index) {
                final category = state.categories[index];
                return ListTile(
                  title: Text(category.name),
                  leading: Image.network(category.thumbUrl),
                  subtitle: Text(category.description),
                );
              },
            );
          } else if (state is RecipeCategoriesError) {
            return Center(child: Text(state.message));
          }
          return const Center(child: Text("Press refresh to load categories"));
        },
      ),
    );
  }
}
