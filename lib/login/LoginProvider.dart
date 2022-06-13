


import 'package:flutter/cupertino.dart';
import 'package:simple_auth_1/utils/Tuple.dart';
import 'package:http/http.dart' as http;

import '../Constants.dart';

typedef LoginType = Tuple<User?, BaseError?>;

// typedef Integer = int;

class LoginProvider with ChangeNotifier {

  User? _loginUser;
  BaseError? _error;


  User? get loginUser {
    return _loginUser;
  }

  BaseError? get error {
    return _error;
  }

  late Tuple<User?, BaseError?> _loginResult;

  Tuple<User?, BaseError?> get loginResult {
    return _loginResult;
  }

  Future doLoginWith(String username, String password) async {

    const url = 'https://bakeology-alpha-stage.herokuapp.com/user/recipes';
    const user = User("Duc Dylan", "dylan.bui@gmail.com", "password duc", 1);

    // chờ 4 giay
    await Future.delayed(const Duration(seconds: 4));

    if (username == "duc" && password == "123") {
      _loginResult = const Tuple(user, null);
    } else {
      const error = BaseError("Login khong thanh cong");
      _loginResult = const Tuple(null, error);
    }

    notifyListeners();
  }

  Future<LoginType> doLogin(String username, String password) async {


    const url = 'https://bakeology-alpha-stage.herokuapp.com/user/recipes';
    const user = User("Duc Dylan", "dylan.bui@gmail.com", "password duc", 1);

    // chờ 4 giay
    await Future.delayed(const Duration(seconds: 4));

    if (username == "duc" && password == "123") {
      return const Tuple(user, null);
    }

    const error = BaseError("Login khong thanh cong");
    return const Tuple(null, error);

    // try {
    //   // final response = await http.get(Uri(url));
    //
    // } catch(error) {
    //
    // }
    // return Tuple(null, null);
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