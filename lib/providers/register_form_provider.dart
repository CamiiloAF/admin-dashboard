import 'package:flutter/cupertino.dart';

class RegisterFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey();

  String name = '';
  String email = '';
  String password = '';

  bool validateForm() {
    return formKey.currentState!.validate();
  }
}
