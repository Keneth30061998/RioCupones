import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _backgroudCover(context),
        ],
      ),
    );
  }

  ///-------------------------------------
  ///Widgets creados por separado
  Widget _backgroudCover(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height*0.4,
      color: Colors.lightGreen
    );
  }
}
