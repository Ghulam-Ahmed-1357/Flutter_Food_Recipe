// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:food_recipe/model.dart';

class DescriptionPage extends StatelessWidget {
  DescriptionPage({super.key, required this.recipeData});
  Recipe recipeData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe Description'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  color: Colors.white,
                  child: Image.network(
                    recipeData.strCategoryThumb,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.contain,
                  )),
              SizedBox(
                height: 10,
              ),
              Text(
                'Dish : ${recipeData.strCategory}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Description :',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              Text(
                recipeData.strCategoryDescription,
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
