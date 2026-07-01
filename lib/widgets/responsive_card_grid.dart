import 'package:flutter/material.dart';

/// [minCardWidth] 기준 반응형 그리드.
/// 1열은 [Column]으로 콘텐츠 높이에 맞게, 2열 이상은 [Wrap]으로 고정 비율 없이 배치.
class ResponsiveCardGrid extends StatelessWidget {
  const ResponsiveCardGrid({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.minCardWidth = 320,
    this.maxColumns = 3,
    this.spacing = 20,
  });

  final int itemCount;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final double minCardWidth;
  final int maxColumns;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;
        final crossAxisCount = (maxWidth / minCardWidth).floor().clamp(
          1,
          maxColumns,
        );

        if (crossAxisCount == 1) {
          return Column(
            children: List.generate(itemCount, (index) {
              return Padding(
                padding: EdgeInsets.only(
                  bottom: index < itemCount - 1 ? spacing : 0,
                ),
                child: itemBuilder(context, index),
              );
            }),
          );
        }

        final itemWidth =
            (maxWidth - (crossAxisCount - 1) * spacing) / crossAxisCount;

        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: List.generate(itemCount, (index) {
            return SizedBox(
              width: itemWidth,
              child: itemBuilder(context, index),
            );
          }),
        );
      },
    );
  }
}
