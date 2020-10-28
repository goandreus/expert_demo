import 'package:flutter/material.dart';

class HomeExpert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Expert'),
      ),
      body: Column(
        children: [
          RaisedButton(
            child: Text('Logout'),
            onPressed: (){
              
            })
        ],
      ),
    );
  }
}