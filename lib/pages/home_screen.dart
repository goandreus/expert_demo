import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
              child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: (){
                  Navigator.pushNamed(context, 'loginStudent');
                },
                child: Container(
                  height: 40,
                  width: 200,
                  color: Colors.grey,
                  child: Text(' Ingresar Estudiante'),
                ),
              ),
              SizedBox(height: 40),
              InkWell(
                onTap: (){

                },
                child: Container(
                  height: 40,
                  width: 200,
                  color: Colors.grey,
                  child: Text(' Ingresar Experto'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}