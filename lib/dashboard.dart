// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_recipe/change_password.dart';
import 'package:food_recipe/contact.dart';
import 'package:food_recipe/descriptionPage.dart';
import 'package:food_recipe/favoriterecipe.dart';
import 'package:food_recipe/login1.dart';
import 'package:food_recipe/model.dart';
import 'package:food_recipe/setting_page.dart';
import 'package:food_recipe/util.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

List<Recipe> recipes = [];
List<Recipe> favoriteRecipes = [];

class _DashboardState extends State<Dashboard> {
  final PageController _controller = PageController(initialPage: 0);
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _fetchRecipes();
  }

  Future<void> _fetchRecipes() async {
    final response = await http.get(
        Uri.parse('https://www.themealdb.com/api/json/v1/1/categories.php'));
    if (response.statusCode == 200 || response.statusCode == 201) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      List<dynamic> categories = jsonResponse['categories'];
      setState(() {
        recipes = categories.map((recipe) => Recipe.fromJson(recipe)).toList();
      });
    } else {
      throw Exception('Failed to load products');
    }
  }

  void onAddButtonTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _controller.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_selectedIndex == 0 ? "Recipes" : "Favorite Recipes"),
        centerTitle: true,
        backgroundColor: Colors.grey,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingPage()));
              },
              icon: Icon(Icons.settings))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: onAddButtonTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'All Recipes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite Recipes',
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Center(
                child: DrawerHeader(
                    child: Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Util.textStyleForHeading("Menu"),
            ))),
            Divider(
              thickness: 0.5,
              color: Colors.grey,
            ),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Dashboard()));
              },
              leading: Icon(Icons.home),
              title: Text("All Recipes"),
            ),
            Divider(
              thickness: 0.5,
              color: Colors.grey,
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FavoritePage(
                              favoriteRecipes: favoriteRecipes,
                              showAppBar: true,
                            )));
              },
              leading: Icon(Icons.favorite),
              title: Text("Favourite Recipes"),
            ),
            Divider(
              thickness: 0.5,
              color: Colors.grey,
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChangePasswordPage()));
              },
              leading: Icon(Icons.change_circle),
              title: Text("Change Password"),
            ),
            Divider(
              thickness: 0.5,
              color: Colors.grey,
            ),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Contact()));
              },
              leading: Icon(Icons.contact_page),
              title: Text("Contact us"),
            ),
            Divider(
              thickness: 0.5,
              color: Colors.grey,
            ),
            ListTile(
              onTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => Login_Page()),
                    (route) => false);
              },
              leading: Icon(Icons.logout),
              title: Text("Logout"),
            ),
            Divider(
              thickness: 0.5,
              color: Colors.grey,
            ),
          ],
        ),
      ),
      body: PageView(
        controller: _controller,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: [
          recipes.isEmpty
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: recipes.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DescriptionPage(
                                    recipeData: recipes[index],
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
                                '${recipes[index].strCategoryThumb}',
                                height: 120,
                              ),
                              subtitle: Text(
                                textAlign: TextAlign.center,
                                recipes[index].strCategory,
                                style: TextStyle(fontSize: 25),
                              ),
                              trailing: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      recipes[index].isFavorite =
                                          !recipes[index].isFavorite;
                                      if (recipes[index].isFavorite) {
                                        favoriteRecipes.add(recipes[index]);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              '${recipes[index].strCategory} added to favorite recipes',
                                            ),
                                          ),
                                        );
                                      } else {
                                        favoriteRecipes.remove(recipes[index]);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              '${recipes[index].strCategory} removed from favorite recipes',
                                            ),
                                          ),
                                        );
                                      }
                                    });
                                  },
                                  icon: Icon(
                                    recipes[index].isFavorite
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: recipes[index].isFavorite
                                        ? Colors.red
                                        : Colors.black,
                                  )),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
          FavoritePage(favoriteRecipes: favoriteRecipes),
        ],
      ),
    );
  }
}
