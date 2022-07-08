

import '../../../commons/base_provider.dart';

class AuthPasswordProvider extends BaseProvider {



  // Day la mo hinh xu ly nut bam goi server
  Future<bool> doAuthPassword(String username, String password) async {

    // chờ 4 giay
    await Future.delayed(const Duration(seconds: 3));

    // Gia lap goi server
    return true;

  }

  // Future<Recipe> fetchAndSetRecipes() async {
  //   const url = 'https://bakeology-alpha-stage.herokuapp.com/user/recipes';
  //   try {
  //     final response = await http.get(url);
  //     final extractedData = json.decode(response.body) as Map<String, dynamic>;
  //     if (extractedData == null) {
  //       return null;
  //     }
  //     final List<Recipe> loadedRecipes = [];
  //     extractedData["recipes"].forEach((recipeData) {
  //       loadedRecipes.add(
  //         Recipe(
  //             id: recipeData["_id"],
  //             title: recipeData["title"],
  //             duration: recipeData["duration"],
  //             imageUrl: recipeData["imageUrl"],
  //             affordability: recipeData["affordability"],
  //             isVegetarian: recipeData["isVegetarian"],
  //             steps: recipeData["steps"],
  //             categories: recipeData["categories"],
  //             chef: recipeData["chef"]["_id"],
  //             chefName: recipeData["chef"]["name"],
  //             chefImageUrl: recipeData["chef"]["profileImageUrl"],
  //             complexity: recipeData["complexity"],
  //             ingredients: recipeData["ingredients"]),
  //       );
  //     });
  //     _recipes = loadedRecipes;
  //     notifyListeners();
  //   } catch (error) {
  //     print(error);
  //     throw error;
  //   }
  // }


}