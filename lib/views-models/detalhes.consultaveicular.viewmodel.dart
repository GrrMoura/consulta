import 'package:consulta_integrada/styles/fonts/fontdefault.styles.dart';
import 'package:flutter/material.dart';

class DetalhesConsultaViewModel {
  final _heightBox = 9.0;
  final _textAlignTitle = TextAlign.start;
  final _textAlignBody = TextAlign.left;
  final _fontTitle = FontDefaultStyles.md();
  final _fontBody = FontDefaultStyles.sm();

  get heightBox => _heightBox;

  get textAlignTitile => _textAlignTitle;
  get textAlignBody => _textAlignBody;

  get fontTitle => _fontTitle;
  get fontBody => _fontBody;
}