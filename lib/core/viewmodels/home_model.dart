import 'package:moneymanager/core/viewmodels/base_model.dart';

class HomeModel extends BaseModel {
  // final AuthenticationService _authenticationService =
  //     locator<AuthenticationService>();

  List months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];

  bool isCollabsed = false;

  String appBarTitle;

  int selectedMonthIndex = DateTime.now().month - 1;

  titleClicked() {
    isCollabsed = !isCollabsed;
    notifyListeners();
  }

  monthClicked(String clickedMonth) {
    selectedMonthIndex = months.indexOf(clickedMonth);

    appBarTitle = clickedMonth;

    titleClicked();

    notifyListeners();
  }

  init() {
    appBarTitle = months[DateTime.now().month - 1].toUpperCase();
  }
}
