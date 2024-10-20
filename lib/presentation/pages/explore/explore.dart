import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whisk_and_serve/domain/entities/category.dart';
import 'package:whisk_and_serve/presentation/blocs/bloc/recipe_categories_bloc.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  ExploreState createState() => ExploreState();
}

class ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<RecipeCategoriesBloc, RecipeCategoriesState>(
        builder: (context, state) {
          if (state is RecipeCategoriesLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is RecipeCategoriesLoaded) {
            return LayoutBuilder(
              builder: (context, constraints) {
                // Determine the number of columns based on screen width
                int columns = 2;
                if (constraints.maxWidth > 600) {
                  columns = 3;
                }
                if (constraints.maxWidth > 900) {
                  columns = 4;
                }
                if (constraints.maxWidth > 1200) {
                  columns = 5;
                }

                return GridView.builder(
                  itemCount: state.categories.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: columns,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 4,
                  ),
                  padding: const EdgeInsets.all(8.0),
                  itemBuilder: (context, index) {
                    final category = state.categories[index];
                    return CategoryItem(category: category);
                  },
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

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            category.thumbUrl,
            width: 120,
            height:120,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 8),
          Text(
            category.name,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
