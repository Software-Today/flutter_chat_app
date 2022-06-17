import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            TextFormField(
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return 'Please fill in email address';
                }
                return null;
              },
              controller: _emailController,
              decoration: const InputDecoration(
                label: Text('Email'),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            TextFormField(
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return 'Please fill in password';
                }
                return null;
              },
              controller: _passwordController,
              decoration: const InputDecoration(
                label: Text('Password'),
              ),
              obscureText: true,
            ),
            TextFormField(
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return 'Please fill in password';
                }
                return null;
              },
              controller: _usernameController,
              decoration: const InputDecoration(
                label: Text('Username'),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                final isValid = _formKey.currentState?.validate();
                if (isValid != true) {
                  return;
                }
                final email = _emailController.text;
                final password = _passwordController.text;
                final username = _usernameController.text;
                final res = await Supabase.instance.client.auth
                    .signUp(email, password, userMetadata: {
                  'username': username,
                });
                final error = res.error;
                if (error != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(error.message),
                      backgroundColor: Colors.red,
                    ),
                  );
                  return;
                }
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
}