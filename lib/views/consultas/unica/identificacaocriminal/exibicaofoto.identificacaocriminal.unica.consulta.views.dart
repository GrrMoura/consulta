import 'dart:typed_data';
import 'package:consulta_integrada/styles/widgets/appbar.widgets.dart';
import 'package:flutter/material.dart';
import 'package:pinch_zoom_image_last/pinch_zoom_image_last.dart';

// ignore: must_be_immutable
class ExibicaoFotoIdentificacaoCriminalUnicaConsultasView
    extends StatefulWidget {
  Uint8List foto;

  ExibicaoFotoIdentificacaoCriminalUnicaConsultasView({
    Key key,
    this.foto,
  }) : super(key: key);

  @override
  _ExibicaoFotoIdentificacaoCriminalUnicaConsultasViewState createState() =>
      _ExibicaoFotoIdentificacaoCriminalUnicaConsultasViewState();
}

class _ExibicaoFotoIdentificacaoCriminalUnicaConsultasViewState
    extends State<ExibicaoFotoIdentificacaoCriminalUnicaConsultasView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBarDefault.getAppComTitulo(titulo: "Foto"),
      body: ListView(
        children: <Widget>[
          Container(
            height: 600,
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            child: PinchZoomImage(
              image: Image.memory(
                widget.foto,
              ),
              zoomedBackgroundColor: const Color.fromRGBO(240, 240, 240, 1.0),
            ),
          ),
        ],
      ),
    );
  }
}
