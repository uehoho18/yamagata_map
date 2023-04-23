import 'package:flutter/material.dart';
import 'package:yamagata_map/components/auth_modal/components/close_modal_button.dart';

class AuthModal extends StatefulWidget {
  const AuthModal({super.key});

  @override
  State<AuthModal> createState() => _AuthModalState();
}

enum AuthModalType {
  signIn,
  signUp;
}

class _AuthModalState extends State<AuthModal> {
  AuthModalType modalType = AuthModalType.signIn;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        height: MediaQuery.of(context).size.height * 0.9,
        child: Column(children: const [
          CloseModalButton(),
        ]));
  }
}
