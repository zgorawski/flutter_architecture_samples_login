import 'package:scoped_model/scoped_model.dart';

class ValidationRule {
  ValidationRule({this.rule, this.isFulfilled});

  final String rule;
  final bool isFulfilled;
}

class LoginModel extends Model {
  LoginModel(this._login, this._password, this._isSpinner) {
    _validationRules = _validate(_password);
  }

  String _login;
  String get login => _login;

  String _password;
  String get password => _password;

  List<ValidationRule> _validationRules;
  List<ValidationRule> get validationRules => _validationRules;

  bool _isSpinner;
  bool get isSpinner => _isSpinner;

  void onLoginChange(String login) {
    _login = login;
  }

  void onPasswordChange(String pass) {
    _password = pass;
    _validationRules = _validate(pass);

    notifyListeners();
  }

  void onLoginButtonPress() {
    _isSpinner = true;

    notifyListeners();
  }

  // business logic, to extract?

  List<ValidationRule> _validate(String login) {
    List<ValidationRule> result = [];

    result.add(ValidationRule(
        rule: "min 8 characters", isFulfilled: login.length > 8));
    result.add(ValidationRule(
        rule: "at last 1 digit",
        isFulfilled: login.contains(new RegExp(r'[0-9]'))));

    return result;
  }
}