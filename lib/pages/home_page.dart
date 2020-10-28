import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   // final Responsive responsive = Responsive.of(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/back.jpg'),
              fit: BoxFit.cover,
            )
          ),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
             InkWell(
               onTap: (){
                 Navigator.pushNamed(context, 'LoginStudentPage');
               },
               child: Student()),
               SizedBox(height: 20),
            // SizedBox(height: responsive.hp(10.0),),
             InkWell(
               onTap: (){
                 Navigator.pushNamed(context, 'LoginExpertPage');
               },
               child: Expert())
           ],),
        )
        ),
    );
    
  }
}

class Student extends StatelessWidget {
  const Student({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final Responsive responsive = Responsive.of(context);
    return Container(
      alignment: Alignment.center,
      height: 40,
      width: 200,
     // height: responsive.hp(15),
     // width: responsive.wp(60),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[200]
      ),
      child: Text('Ingresar como estudiante', style: TextStyle(fontWeight: FontWeight.w600),),
    );
  }
}

class Expert extends StatelessWidget {
  const Expert({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   // final Responsive responsive = Responsive.of(context);
    return Container(
      alignment: Alignment.center,
      height: 40,
      width: 200,
    //  height: responsive.hp(15),
    //  width: responsive.wp(60),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey[100]
      ),
      child: Text('Ingresar como experto', style: TextStyle(fontWeight: FontWeight.w600),),
    );
  }
}