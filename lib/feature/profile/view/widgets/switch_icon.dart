import 'package:commerce_hub/core/theming/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum SwitchType {
  theme,
  notification,
  other
}

class SwitchWidget extends StatefulWidget {
  const SwitchWidget({
    super.key, 
    this.switchType = SwitchType.other
  });
  
  final SwitchType switchType;

  @override
  State<SwitchWidget> createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  bool _isNotificationEnabled = false;
  bool _isOtherSwitchEnabled = false;
  
  @override
  Widget build(BuildContext context) {
    // Only use ThemeProvider for theme switch
    if (widget.switchType == SwitchType.theme) {
      return Center(
        child: Row(
          children: [
            Transform.scale(
              scale: .7,
              child: Consumer<ThemeProvider>(
                builder: (context, themeProvider, _) {
                  return Switch(
                    value: themeProvider.isDarkMode,
                    onChanged: (value) {
                      // Use Future.microtask to schedule the theme change for the next frame
                      Future.microtask(() {
                        themeProvider.toggleTheme();
                      });
                    },
                    activeColor: Colors.green,
                  );
                },
              ),
            ),
          ],
        ),
      );
    } 
    // For notification switch
    else if (widget.switchType == SwitchType.notification) {
      return Center(
        child: Row(
          children: [
            Transform.scale(
              scale: .7,
              child: Switch(
                value: _isNotificationEnabled,
                onChanged: (value) {
                  setState(() {
                    _isNotificationEnabled = value;
                    // Handle notification toggle logic here
                  });
                },
                activeColor: Colors.green,
              ),
            ),
          ],
        ),
      );
    }
    // For other switches
    else {
      return Center(
        child: Row(
          children: [
            Transform.scale(
              scale: .7,
              child: Switch(
                value: _isOtherSwitchEnabled,
                onChanged: (value) {
                  setState(() {
                    _isOtherSwitchEnabled = value;
                    // Handle other switch toggle logic here
                  });
                },
                activeColor: Colors.green,
              ),
            ),
          ],
        ),
      );
    }
  }
}