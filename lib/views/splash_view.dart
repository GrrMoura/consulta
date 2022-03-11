import 'package:consulta_integrada/views/termo.view.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashState createState() => new _SplashState();
}

class _SplashState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return SplashScreenView();
  }
}

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({Key key}) : super(key: key);

  Future delay(context) async {
    await Future.delayed(Duration(milliseconds: 1500)).then((_) => {
          Navigator.push(
            context,
            PageTransition(
              child: TermoView(),
              type: PageTransitionType.fade,
              duration: const Duration(milliseconds: 800),
            ),
          )
        });
  }

  @override
  Widget build(BuildContext context) {
    delay(context);
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 140),
              Text("Consulta Integrada", style: TextStyle(fontSize: 25)),
              Container(
                  height: 350,
                  width: double.infinity,
                  child: Image.asset("ssp_logo.png")),
              Text("SSP")
            ],
          ),
        ),
      ),
    );
  }
}
