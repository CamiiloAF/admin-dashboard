import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/providers/login_form_provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/layouts/auth/widgets/link_text.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../buttons/custom_outlined_button.dart';
import '../inputs/custom_inputs.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return ChangeNotifierProvider(
      create: (context) => LoginFormProvider(),
      child: Builder(builder: (context) {
        final loginFormProvider =
            Provider.of<LoginFormProvider>(context, listen: false);

        return Container(
          margin: const EdgeInsets.only(top: 100),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 370),
              child: Form(
                key: loginFormProvider.formKey,
                autovalidateMode: AutovalidateMode.always,
                child: Column(
                  children: [
                    TextFormField(
                      style: const TextStyle(color: Colors.white),
                      decoration: CustomInputs.getLoginInputStyle(
                        hint: 'Ingrese su correo',
                        label: 'Email',
                        icon: Icons.email_outlined,
                      ),
                      onChanged: (value) => loginFormProvider.email = value,
                      validator: (value) {
                        if (!EmailValidator.validate(value!)) {
                          return 'Email no válido';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      style: const TextStyle(color: Colors.white),
                      obscureText: true,
                      decoration: CustomInputs.getLoginInputStyle(
                        hint: '*********',
                        label: 'Contraseña',
                        icon: Icons.lock_outline_rounded,
                      ),
                      onChanged: (value) => loginFormProvider.password = value,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ingrese su contraseña';
                        }
                        if (value.length < 6) {
                          return 'La contraseña debe de ser de 6 caracteres';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    CustomOutlinedButton(
                      onPressed: () {
                        final isValid = loginFormProvider.validateForm();
                        if (isValid) {
                          authProvider.login(
                            loginFormProvider.email,
                            loginFormProvider.password,
                          );
                        }
                      },
                      text: 'Ingresar',
                    ),
                    const SizedBox(height: 20),
                    LinkText(
                      text: 'Nueva cuenta',
                      onPressed: () {
                        Navigator.pushNamed(context, Flurorouter.registerRoute);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
