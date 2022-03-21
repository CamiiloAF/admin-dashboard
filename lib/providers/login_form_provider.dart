import 'package:flutter/cupertino.dart';

class LoginFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey();
  String email = '';
  String password = '';

  bool validateForm() {
    return formKey.currentState!.validate();
  }
}
