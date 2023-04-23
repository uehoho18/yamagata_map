import 'package:flutter/material.dart';
import 'package:yamagata_map/components/auth_modal/components/close_modal_button.dart';

enum AuthModalType {
  signIn,
  signUp;
}

class AuthModal extends StatefulWidget {
  const AuthModal({super.key});

  @override
  State<AuthModal> createState() => _AuthModalState();
}

class _AuthModalState extends State<AuthModal> {
  AuthModalType modalType = AuthModalType.signIn;
  String buttonLabel = '新規登録へ';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      height: MediaQuery.of(context).size.height * 0.9,
      child: Column(
        children: [
          const CloseModalButton(),
          modalType == AuthModalType.signIn
              ? const Text('Sign In')
              : const Text('Sign Up'),
          TextButton(
            onPressed: switchModalType,
            child: Text(buttonLabel),
          ),
        ],
      ),
    );
  }

  void switchModalType() {
    setState(() {
      modalType = modalType == AuthModalType.signIn
          ? AuthModalType.signUp
          : AuthModalType.signIn;

      buttonLabel = modalType == AuthModalType.signIn ? '新規登録へ' : 'サインインへ';
    });
  }
}
