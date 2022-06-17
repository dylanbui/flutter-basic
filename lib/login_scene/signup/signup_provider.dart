import 'package:simple_auth_1/api/user_api.dart';
import 'package:simple_auth_1/commons/base_proviver.dart';
import 'package:simple_auth_1/utils/tuple.dart';
import '../../constants.dart';


class SignupProvider extends BaseProvider {

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

  // Day la mo hinh xu ly nut bam goi server
  // Future<LoginType> doLogin(String username, String password) async {
  //
  //   // Gia lap goi server
  //   return await UserApi().doLogin(username, password);
  //
  // }

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