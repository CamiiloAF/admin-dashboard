import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/layouts/auth/widgets/link_text.dart';
import 'package:flutter/material.dart';

import '../buttons/custom_outlined_button.dart';
import '../inputs/custom_inputs.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 100),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
          child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 370),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                style: const TextStyle(color: Colors.white),
                decoration: CustomInputs.getLoginInputStyle(
                  hint: 'Ingrese su nombre',
                  label: 'Nombre',
                  icon: Icons.supervised_user_circle_sharp,
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                style: const TextStyle(color: Colors.white),
                decoration: CustomInputs.getLoginInputStyle(
                  hint: 'Ingrese su correo',
                  label: 'Email',
                  icon: Icons.email_outlined,
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                style: const TextStyle(color: Colors.white),
                decoration: CustomInputs.getLoginInputStyle(
                  hint: '*********',
                  label: 'Contraseña',
                  icon: Icons.lock_outline_rounded,
                ),
              ),
              const SizedBox(height: 20),
              CustomOutlinedButton(onPressed: () {}, text: 'Crear cuenta'),
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
      )),
    );
  }
}
