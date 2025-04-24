import 'package:commerce_hub/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchForFruit extends StatelessWidget {
  const SearchForFruit({super.key, required this.onChanged});
  final Function(String?) onChanged;
  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      hintText: '.....ابحث عن',
      validator: (value) => null, // No validation needed
      onChanged: (value) => onChanged(value),
      backgroundColor: const Color(0xff949D9E).withValues(alpha: 0.2),
      suffixIcon: const Icon(FontAwesomeIcons.magnifyingGlass),
      prefixIcon: const Icon(FontAwesomeIcons.barsStaggered),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
    );
  }
}
