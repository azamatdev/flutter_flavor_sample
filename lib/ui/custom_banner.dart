import 'package:flutter/material.dart';

class CustomBanner extends StatelessWidget {
  final String? text;
  final AlignmentGeometry alignment;

  const CustomBanner(
    this.text,
    this.alignment,
  ) : super();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        child: Banner(
          message: text ?? '',
          location: alignment == Alignment.bottomLeft
              ? BannerLocation.bottomStart
              : BannerLocation.bottomEnd,
        ),
      ),
    );
  }
}
