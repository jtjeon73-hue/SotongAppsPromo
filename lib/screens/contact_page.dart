import 'package:flutter/material.dart';

import '../layout/page_scaffold.dart';
import '../widgets/contact_section.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PageScaffoldBody(children: [ContactSection()]);
  }
}
