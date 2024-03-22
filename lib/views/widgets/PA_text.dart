import 'package:flutter/material.dart';

class PAText extends StatelessWidget {
  const PAText(
    this.text, {
    this.align = TextAlign.start,
    this.color = Colors.black,
    this.style,
    this.columAlignment = Alignment.centerLeft,
    super.key,
  });

  final Alignment columAlignment;
  final TextAlign align;
  final String text;
  final TextStyle? style;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return _buildText();
  }

  Widget _buildText() {
    var dlgStyle = TextStyle(
      color: color,
    );

    var providedStyle = dlgStyle.merge(style);
    return Align(
      alignment: columAlignment,
      child: Text(
        text,
        style: providedStyle,
        textAlign: align,
        overflow: TextOverflow.visible,
      ),
    );
  }
}
