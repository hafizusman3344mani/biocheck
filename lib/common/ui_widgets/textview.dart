
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Textview extends StatelessWidget {
  String _title;
  double _fontSize;
  FontWeight _fontWeight;
  Color _color;
  TextAlign _textAlign;

  Textview(this._title, this._fontSize, this._fontWeight, this._color,
      this._textAlign);

  @override
  Widget build(BuildContext context) {
    return Text(
          _title,
          textAlign: _textAlign,
          style: TextStyle(
            height: 1.3,
            fontWeight: _fontWeight,
            color: _color,
            fontSize: _fontSize,
          ),
    );
  }
}

