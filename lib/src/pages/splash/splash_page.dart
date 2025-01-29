import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/img/cupon-de-descuento.png',height: 150,width: 150,),
            Text('Cupones',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF3C3F41),
              ),
            ),
            SizedBox(height: 20,),

          ],
        ),
      ),
    );
  }
}
