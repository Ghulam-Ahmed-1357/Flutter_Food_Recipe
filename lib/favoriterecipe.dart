import 'package:food_recipe/dashboard.dart';
import 'package:food_recipe/descriptionPage.dart';
import 'package:food_recipe/model.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget {
  final List<Recipe> favoriteRecipes;
  final bool showAppBar;

  FavoritePage({required this.favoriteRecipes, this.showAppBar = false});

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

// bool showAppBar1 = false;

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.showAppBar
          ? AppBar(
              title: Text('Favorite Recipes'),
              backgroundColor: Colors.grey,
            )
          : null,
      body: widget.favoriteRecipes.isEmpty
          ? Column(
              children: [
                if (widget.showAppBar)
                  SizedBox(height: 56), // Adds space for the AppBar if needed
                Expanded(
                  child: Center(
                    child: Text('No favorites yet!'),
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemCount: favoriteRecipes.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DescriptionPage(
                                recipeData: favoriteRecipes[index],
                              )),
                    );
                  },
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 4,
                        child: ListTile(
                          title: Image.network(
                            '${favoriteRecipes[index].strCategoryThumb}',
                            height: 120,
                          ),
                          subtitle: Text(
                            textAlign: TextAlign.center,
                            '${favoriteRecipes[index].strCategory}',
                            style: TextStyle(fontSize: 25),
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              setState(() {
                                favoriteRecipes[index].isFavorite =
                                    recipes[index].isFavorite = false;
                                favoriteRecipes.removeAt(index);
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content:
                                        Text('Recipe removed from favorites')),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
