import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/ui/ui_utils.dart';

class AuthInputBox extends HookConsumerWidget {
  const AuthInputBox({
    super.key,
    this.controller,
    required this.label,
    required this.prefixIcon,
    this.validator,
    this.obscureText = false,
  });

  final TextEditingController? controller;
  final String label;
  final IconData prefixIcon;
  final String? Function(String?)? validator;
  final bool? obscureText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hideText = useState<bool>(obscureText!);
    return TextFormField(
      controller: controller,
      obscureText: hideText.value,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: context.textTheme.labelMedium!.copyWith(
          color: context.scheme.outline,
        ),
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        prefixIcon: Icon(prefixIcon),
        // first we are checking initial obscureText value.
        // if it is false that means its not password field
        // so we don't need to toggle the visibility.
        suffixIcon: !obscureText!
            ? null
            : hideText.value
                ? InkWell(
                    onTap: () {
                      hideText.value = !hideText.value;
                    },
                    child: Icon(
                      Icons.remove_red_eye,
                      color: context.scheme.outline,
                    ),
                  )
                : InkWell(
                    onTap: () {
                      hideText.value = !hideText.value;
                    },
                    child: Icon(
                      Icons.visibility_off,
                      color: context.scheme.outline,
                    ),
                  ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      validator: validator,
    );
  }
}
