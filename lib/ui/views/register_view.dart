import 'package:admin_dashboard/providers/register_form_provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/layouts/auth/widgets/link_text.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../buttons/custom_outlined_button.dart';
import '../inputs/custom_inputs.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegisterFormProvider(),
      child: Builder(builder: (context) {
        final registerFormProvider =
            Provider.of<RegisterFormProvider>(context, listen: false);

        return Container(
          margin: const EdgeInsets.only(top: 30),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 370),
              child: Form(
                key: registerFormProvider.formKey,
                autovalidateMode: AutovalidateMode.always,
                child: Column(
                  children: [
                    TextFormField(
                      style: const TextStyle(color: Colors.white),
                      decoration: CustomInputs.getLoginInputStyle(
                        hint: 'Ingrese su nombre',
                        label: 'Nombre',
                        icon: Icons.supervised_user_circle_sharp,
                      ),
                      onChanged: (value) => registerFormProvider.name = value,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ingrese su nombre';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      style: const TextStyle(color: Colors.white),
                      decoration: CustomInputs.getLoginInputStyle(
                        hint: 'Ingrese su correo',
                        label: 'Email',
                        icon: Icons.email_outlined,
                      ),
                      onChanged: (value) => registerFormProvider.email = value,
                      validator: (value) {
                        if (!EmailValidator.validate(value ?? '')) {
                          return 'Email no válido';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      style: const TextStyle(color: Colors.white),
                      decoration: CustomInputs.getLoginInputStyle(
                        hint: '*********',
                        label: 'Contraseña',
                        icon: Icons.lock_outline_rounded,
                      ),
                      onChanged: (value) =>
                          registerFormProvider.password = value,
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
                          registerFormProvider.validateForm();
                        },
                        text: 'Crear cuenta'),
                    const SizedBox(height: 20),
                    LinkText(
                      text: 'Ir al login',
                      onPressed: () {
                        Navigator.pushNamed(context, Flurorouter.loginRoute);
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
