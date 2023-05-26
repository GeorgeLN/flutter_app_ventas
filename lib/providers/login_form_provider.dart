import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {

    //Se coloca "FormState" de acuerdo al widget donde se está referenciando el Key (en este caso un FORM).
    GlobalKey<FormState> formKey = GlobalKey<FormState>();

    String email    = '';
    String password = '';

    bool _isLoading = false;

    bool get isLoading {

      return _isLoading;
    }

    set isLoading( bool value ) {

      _isLoading = value;

      notifyListeners();
    }

    bool isValidForm() {

      print(formKey.currentState?.validate());

      return formKey.currentState?.validate() ?? false; //Si el formulario es valido.
    }
}