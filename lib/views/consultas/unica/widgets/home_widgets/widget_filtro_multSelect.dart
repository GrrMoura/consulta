import 'package:consulta_integrada/models/opcao.models.dart';
import 'package:consulta_integrada/styles/fonts/fontdefault.styles.dart';
import 'package:consulta_integrada/styles/theme/default.theme.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';

// ignore: camel_case_types, must_be_immutable
class FiltrosMultiSelect extends StatelessWidget {
  var model;
  FiltrosMultiSelect(this.model, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: MultiSelectDialogField(
        items: model.items,
        initialValue: model.opcoesSelecionadas,
        title: Text("Pesquisar em:"),
        selectedColor: DefaultTheme.getColor(),
        decoration: BoxDecoration(
          color: DefaultTheme.getColor().withOpacity(0.1),
          borderRadius: BorderRadius.all(Radius.circular(15)),
          border: Border.all(
            width: 0.1,
          ),
        ),
        buttonIcon: Icon(
          Icons.filter_alt_outlined,
          color: DefaultTheme.getColor(),
          size: 15,
        ),
        buttonText: Text("Pesquisar em:", style: FontDefaultStyles.sm_1()),
        onConfirm: (results) {
          model.opcoesSelecionadas =
              results.map((option) => option as OpcaoModels).toList();
        },
      ),
    );
  }
}
