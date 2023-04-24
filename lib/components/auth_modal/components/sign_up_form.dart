import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yamagata_map/components/auth_modal/components/auth_text_form_field.dart';
import 'package:yamagata_map/components/auth_modal/components/submit_button.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    super.key,
  });

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // ---------  Validation ---------

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

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    // パスワードテキストフィールドの内容と照合
    if (value != _passwordController.text) {
      return 'Password does not match';
    }
    return null;
  }

  // サインアップ
  Future<UserCredential?> signUp({
    required String email,
    required String password,
  }) async {
    try {
      return await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException {
      // エラーハンドリング
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Sign Up', // 変更
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
          AuthTextFormField(
            obscureText: true,
            validator: validateConfirmPassword,
            labelText: 'Confirm Password',
          ),
          const SizedBox(height: 16.0),
          SubmitButton(
            labelName: '新規登録', // 変更
            onTap: () => _submit(context),
          ),
        ],
      ),
    );
  }

  Future<void> _submit(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      //サインアップの処理
      final UserCredential? user = await signUp(
          email: _emailController.text, password: _passwordController.text);

      //画面が破棄されている場合、後続処理を行わない
      if (!mounted) return;

      //モーダル表示
      if (user != null) {
        Navigator.of(context).pop();
      }
    }
  }
}
