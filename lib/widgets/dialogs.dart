import 'package:flutter/cupertino.dart';

class Dialogs {
  static void alert(
    BuildContext ctx,
    {String title = "", String message = ""}
  ){
    showCupertinoDialog(context: ctx, builder: (BuildContext context){
      return CupertinoAlertDialog(
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
        content: Text(message, style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15),),
        actions: [
          CupertinoDialogAction(
            onPressed: (){
              Navigator.pop(context);
            },
            child: Text('OK'),
            )
        ],
      );
    });
  }
}