import 'package:flutter/material.dart';

import 'app_project.dart';

class AppCategory {
  const AppCategory({
    required this.title,
    required this.description,
    required this.icon,
    required this.accentColor,
  });

  final String title;
  final String description;
  final IconData icon;
  final Color accentColor;
}

class DevelopmentDirection {
  const DevelopmentDirection({
    required this.title,
    required this.description,
    required this.icon,
  });

  final String title;
  final String description;
  final IconData icon;
}

class ProcessStep {
  const ProcessStep({
    required this.step,
    required this.title,
    required this.description,
  });

  final int step;
  final String title;
  final String description;
}

class PromoLink {
  const PromoLink({
    required this.title,
    this.url,
    required this.promoStatus,
    this.hasPromoUrl = false,
    this.buttonText = '프로모 보기',
  });

  final String title;
  final String? url;
  final String promoStatus;
  final bool hasPromoUrl;
  final String buttonText;

  bool get canOpen => hasPromoUrl && url != null && url!.trim().isNotEmpty;

  bool get isPromoLive => promoStatus == PromoStatus.live;
}

class MonetizationCard {
  const MonetizationCard({
    required this.title,
    required this.description,
    required this.icon,
  });

  final String title;
  final String description;
  final IconData icon;
}

class FutureIdea {
  const FutureIdea({required this.title, required this.icon});

  final String title;
  final IconData icon;
}
