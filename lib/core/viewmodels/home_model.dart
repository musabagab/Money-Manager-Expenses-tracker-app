import 'package:moneymanager/core/services/authentication_service.dart';
import 'package:moneymanager/core/viewmodels/base_model.dart';

import '../../locator.dart';

class HomeModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
}
