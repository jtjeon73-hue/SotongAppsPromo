import 'package:flutter/material.dart';

import '../layout/page_scaffold.dart';
import '../widgets/development_process_section.dart';

class ProcessPage extends StatelessWidget {
  const ProcessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PageScaffoldBody(children: [DevelopmentProcessSection()]);
  }
}
