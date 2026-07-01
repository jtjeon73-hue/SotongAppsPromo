import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// Flutter Web에서는 [canLaunchUrl]이 https URL에 false를 반환하는 경우가 있어
/// 직접 [launchUrl]을 호출합니다.
Future<bool> launchExternalUrl(String url) async {
  final uri = Uri.parse(url);
  try {
    if (kIsWeb) {
      return await launchUrl(uri, webOnlyWindowName: '_blank');
    }
    return await launchUrl(uri, mode: LaunchMode.externalApplication);
  } catch (_) {
    return false;
  }
}

Future<bool> launchEmail({required String email, String? subject}) async {
  final uri = Uri(
    scheme: 'mailto',
    path: email,
    query: subject != null ? 'subject=${Uri.encodeComponent(subject)}' : null,
  );
  try {
    return await launchUrl(uri);
  } catch (_) {
    return false;
  }
}

class SectionContainer extends StatelessWidget {
  const SectionContainer({
    super.key,
    required this.child,
    this.backgroundColor,
    this.padding,
  });

  final Widget child;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: backgroundColor,
      padding:
          padding ?? const EdgeInsets.symmetric(horizontal: 24, vertical: 72),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: child,
        ),
      ),
    );
  }
}

int responsiveColumns(double width) {
  if (width >= 1100) return 3;
  if (width >= 720) return 2;
  return 1;
}

int gridColumns(double width, {int max = 4}) {
  if (width >= 1100) return max;
  if (width >= 800) return max > 2 ? 2 : max;
  return 1;
}
