import 'package:ai_animals_lottery/src/core/services/url_service.dart';
import 'package:flutter/material.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen width to handle the banner size.
    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: _onTap,
      child: Image.asset(
        'assets/ads/royal-banner.gif',
        width: screenWidth,
        height: screenWidth / 10,
        fit: BoxFit.contain,
      ),
    );
  }

  void _onTap() {
    UrlService.openUrlString('https://www.apuestasroyal.com/');
  }
}
