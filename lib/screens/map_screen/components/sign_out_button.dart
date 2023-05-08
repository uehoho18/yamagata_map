import 'package:flutter/material.dart';
import 'package:yamagata_map/components/auth_modal/app_loading.dart';

class SignOutButton extends StatelessWidget {
  const SignOutButton({
    super.key,
    required this.onPressed,
    this.isLoadhing = false,
    required bool isLoading,
  });

  final VoidCallback onPressed;
  final bool isLoadhing;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: isLoading ? const AppLoading() : const Icon(Icons.logout),
    );
  }
}
