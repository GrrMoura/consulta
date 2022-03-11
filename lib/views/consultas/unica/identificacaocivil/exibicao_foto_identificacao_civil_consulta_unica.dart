// ignore_for_file: must_be_immutable

import 'dart:typed_data';
import 'package:consulta_integrada/styles/widgets/appbar.widgets.dart';
import 'package:flutter/material.dart';
import 'package:pinch_zoom_image_last/pinch_zoom_image_last.dart';

class ExibicaoFotoIdentificacaoCivilUnicaConsultasView extends StatefulWidget {
  Uint8List foto;

  ExibicaoFotoIdentificacaoCivilUnicaConsultasView({Key key, this.foto})
      : super(key: key);

  @override
  _ExibicaoFotoIdentificacaoCriminalUnicaConsultasViewState createState() =>
      _ExibicaoFotoIdentificacaoCriminalUnicaConsultasViewState();
}

class _ExibicaoFotoIdentificacaoCriminalUnicaConsultasViewState
    extends State<ExibicaoFotoIdentificacaoCivilUnicaConsultasView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBarDefault.getAppComTitulo(titulo: "Foto"),
      body: ListView(
        children: <Widget>[
          Center(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: PinchZoomImage(
                image: Image.memory(
                  widget.foto,
                ),
                zoomedBackgroundColor: const Color.fromRGBO(240, 240, 240, 1.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ExtendedImage.memory(widget.foto,
//                     width: double.infinity, fit: BoxFit.fitWidth)),