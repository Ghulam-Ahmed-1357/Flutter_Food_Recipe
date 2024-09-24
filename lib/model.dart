import 'dart:convert';

Recipe welcomeFromJson(String str) => Recipe.fromJson(json.decode(str));

String welcomeToJson(Recipe data) => json.encode(data.toJson());

class Recipe {
  String idCategory;
  String strCategory;
  String strCategoryThumb;
  String strCategoryDescription;
  bool isFavorite;

  Recipe({
    required this.idCategory,
    required this.strCategory,
    required this.strCategoryThumb,
    required this.strCategoryDescription,
    this.isFavorite = false,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
        idCategory: json["idCategory"],
        strCategory: json["strCategory"],
        strCategoryThumb: json["strCategoryThumb"],
        strCategoryDescription: json["strCategoryDescription"],
        isFavorite: false,
      );

  Map<String, dynamic> toJson() => {
        "idCategory": idCategory,
        "strCategory": strCategory,
        "strCategoryThumb": strCategoryThumb,
        "strCategoryDescription": strCategoryDescription,
      };
}
