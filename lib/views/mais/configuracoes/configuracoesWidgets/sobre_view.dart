import 'package:consulta_integrada/styles/fonts/fontdefault.styles.dart';
import 'package:consulta_integrada/styles/theme/imagespath.theme.dart';
import 'package:consulta_integrada/styles/widgets/appbar.widgets.dart';
import 'package:flutter/material.dart';

class Sobre extends StatelessWidget {
  const Sobre({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Todos os direitos reservados © 2022",
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),
          ),
        ],
      ),
      appBar: AppBarDefault.getAppComTitulo(titulo: "Sobre"),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 30),
                child: Image.asset(ImagesPathTheme.getLogoTheme(),
                    height: 180, width: 180),
              ),
              Text("Secretário", style: FontDefaultStyles.sm_1Bold()),
              Text("João Eloy de Menezes", style: FontDefaultStyles.sm_1()),
              SizedBox(height: 15),
              Text("Desenvolvido pela CPSI",
                  style: FontDefaultStyles.sm_1Bold()),
              Text("Diretoria de Tecnologia da Informação",
                  style: FontDefaultStyles.sm_1()),
              SizedBox(height: 15),
              Text(
                "Diretora",
                style: FontDefaultStyles.sm_1Bold(),
              ),
              Text("Elisabeth Cristina Correia de Melo",
                  style: FontDefaultStyles.sm_1()),
              SizedBox(height: 15.0),
              Text("Analista", style: FontDefaultStyles.sm_1Bold()),
              Text(
                "Leandro da Silva Azevedo",
                style: FontDefaultStyles.sm_1(),
              ),
              SizedBox(height: 15.0),
              Text(
                "Desenvolvedores",
                style: FontDefaultStyles.sm_1Bold(),
              ),
              Text(
                "Geibison Roberto Rocha de Moura",
                style: FontDefaultStyles.sm_1(),
              ),
              Text(
                "Luiz Carlos da Conceição Júnior",
                style: FontDefaultStyles.sm_1(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
