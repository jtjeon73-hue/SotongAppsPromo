import 'package:flutter/material.dart';

import '../theme/promo_theme.dart';
import '../widgets/footer_section.dart';

/// 라우트 본문용 공통 스크롤 레이아웃 (푸터 포함).
class PageScaffoldBody extends StatelessWidget {
  const PageScaffoldBody({
    super.key,
    required this.children,
    this.padding = EdgeInsets.zero,
  });

  final List<Widget> children;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: ColoredBox(
        color: PromoColors.beige,
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: padding,
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  ...children,
                  const FooterSection(),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
