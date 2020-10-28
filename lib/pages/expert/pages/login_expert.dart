import 'package:flutter/material.dart';

class LoginExpert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 100,),
              Logo(),
              Formlogin(),
            ],
          ),
        ),
      ),
    );
  }
}

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      child: Image(
        image: AssetImage('assets/teacher.png')
      ),
    );
  }
}

class Formlogin extends StatefulWidget {
  
  @override
  _FormloginState createState() => _FormloginState();
}

class _FormloginState extends State<Formlogin> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  final TextEditingController _email = TextEditingController();

  final TextEditingController _pass = TextEditingController();

  bool isBussy = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _form,
      child: Container(
        constraints: BoxConstraints(maxWidth: 300, minWidth: 300),
        child: Column(
          children: [
            SizedBox(height:40),
            Text('Iniciar sesion - Experto', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),),
            SizedBox(height:30),
            TextFormField(
              controller: _email,
              validator: (val) {
                if (val.isEmpty) return 'Este campo es requerido';
                return null; 
              },
              decoration:  InputDecoration(hintText: 'CORREO'),
            ),
            TextFormField(
              controller: _pass,
              obscureText: true,
              validator: (val) {
                if (val.isEmpty) return 'Este campo es requerido';
                return null; 
              },
              decoration:  InputDecoration(hintText: 'CONTRASEñA'),
            ),
            SizedBox(height:30),
            InkWell(
              onTap: (){
                if(_form.currentState.validate()) {
                  // setState(() {
                  //   isBussy = true;
                  // });
                  // setState(() {
                  //   isBussy = false;
                  // });
                }
              },
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.green
                ),
                child: Text('Ingresar', style: TextStyle(color: Colors.white, fontSize: 18),),
              ),
            )
          ]
        ),
      ),
    );
  }
}