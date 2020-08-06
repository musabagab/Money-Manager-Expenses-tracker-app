import 'package:moneymanager/core/models/category.dart';
import 'package:moneymanager/core/services/category_icon_service.dart';
import 'package:moneymanager/core/viewmodels/base_model.dart';
import 'package:moneymanager/locator.dart';

class NewTransactionModel extends BaseModel {
  final CategoryIconService _categoryIconService =
      locator<CategoryIconService>();

  int selectedItem = 1;

  void changeSelectedItem(int newItemIndex) {
    selectedItem = newItemIndex;

    notifyListeners();
  }

  List<Category> loadCategoriesIcons() {
    if (selectedItem == 1) {
      // load income
      List<Category> s = _categoryIconService.incomeList.toList();
      return s;
    } else {
      // load expense
      List<Category> s = _categoryIconService.expenseList.toList();
      return s;
    }
  }
}
