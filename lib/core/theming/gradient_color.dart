import 'package:flutter/material.dart';

/// returns a linear gradient
LinearGradient getGradient(Color color) => LinearGradient(
      colors: [
        color.withValues(alpha: 0.5),
        color.withValues(alpha: 0.1),
      ],
      stops: const [0.0, 0.7],
    );
