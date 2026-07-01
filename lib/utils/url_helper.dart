import 'package:flutter/foundation.dart';
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
