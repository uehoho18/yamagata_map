import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yamagata_map/components/auth_modal/components/auth_text_form_field.dart';
import 'package:yamagata_map/components/auth_modal/components/submit_button.dart';

// importは省略しています

class SignInForm extends StatefulWidget {
  const SignInForm({
    super.key,
  });

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // バリデーションのコード
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  // サインイン
  Future<UserCredential?> signIn({
    required String email,
    required String password,
  }) async {
    try {
      return await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseException {
      //エラーハンドリング
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const Text(
            'Sign In',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16.0),
          AuthTextFormField(
            controller: _emailController,
            validator: validateEmail,
            labelText: 'Email',
          ),
          const SizedBox(height: 16.0),
          AuthTextFormField(
            controller: _passwordController,
            obscureText: true,
            validator: validatePassword,
            labelText: 'Password',
          ),
          const SizedBox(height: 16.0),
          SubmitButton(
            labelName: 'サインイン',
            onTap: () => _submit(context),
          ),
        ],
      ),
    );
  }

  Future<void> _submit(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      //サインインの処理
      final UserCredential? user = await signIn(
          email: _emailController.text, password: _passwordController.text);

      // 画面が破棄されている場合、後続処理を行わない
      if (!mounted) return;

      if (user != null) {
        Future.delayed(
          const Duration(microseconds: 500),
          Navigator.of(context).pop,
        );
      }
    }
  }
}
