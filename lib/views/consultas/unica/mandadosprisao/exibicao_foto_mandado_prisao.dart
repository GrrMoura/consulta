// ignore_for_file: must_be_immutable

import 'dart:convert';
import 'package:consulta_integrada/styles/widgets/appbar.widgets.dart';
import 'package:flutter/material.dart';
import 'package:pinch_zoom_image_last/pinch_zoom_image_last.dart';

class ExibicaoFotoMandadoDePrisao extends StatefulWidget {
  String foto;

  ExibicaoFotoMandadoDePrisao(this.foto, {Key key}) : super(key: key);

  @override
  _ExibicaoFotoMandadoDePrisaoState createState() =>
      _ExibicaoFotoMandadoDePrisaoState();
}

class _ExibicaoFotoMandadoDePrisaoState
    extends State<ExibicaoFotoMandadoDePrisao> {
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
                image: Image.memory(base64Decode(widget.foto)),
                zoomedBackgroundColor: const Color.fromRGBO(240, 240, 240, 1.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
