//task 2
import 'package:flutter/material.dart';

import 'package:flutter_application_1/validators/login_validators.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _submitted = false;

  void _submit() {
    final isValid = _formKey.currentState!.validate();

    setState(() {
      _submitted = isValid;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Email',
            ),
            validator: validateEmail,
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Password',
            ),
            obscureText: true,
            validator: validatePassword,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _submit,
            child: const Text('Login'),
          ),
          if (_submitted) const Text('Submitted'),
        ],
      ),
    );
  }
}