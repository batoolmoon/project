import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class select extends StatefulWidget {
  const select({Key? key}) : super(key: key);

  @override
  _selectState createState() => _selectState();
}

class _selectState extends State<select> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
            fit: StackFit.expand,
            alignment: Alignment.topCenter,
            children: <Widget>[
        Container(
        color:  Colors.white,
      ),
      Positioned.fill(
      child: BackdropFilter(
      filter: ImageFilter.blur(
      sigmaX: 2.0,
      sigmaY: 2.0,
      ),
      child: Container(
      child: ListView(
      children: <Widget>[
      Container(
      padding: const EdgeInsets.only(top: 70.0, bottom: 40.0),
      alignment: Alignment.center,
      child: Image.asset(
      'images/sport.png',
      width: 170.0,
      ),
      ),
      Container(
      alignment: Alignment.center,
      child: Text(context.localeString('welcome_application_name'), style: const TextStyle(color: Colors.white, fontFamily: 'Cairo', fontSize: 20.0),),
      ),
      const SizedBox(height: 70.0,),
      Column(
      children: [
      Container(
      padding: const EdgeInsets.only(right: 0.0, left: 0.0, top: 1.0),
      child: ElevatedButton(
      style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.only(right: 70.0, left: 70.0, top: 10.0, bottom: 10.0 ),
      primary: Colors.white,
      shape: styles.circleBtn(),
      elevation: 0.0,

      ),
      //
      onPressed: ()=>Login(),
      child: Text('Log in',style: styles.startBtn, textAlign: TextAlign.center),
      ),
      ),
      Container(
      padding: const EdgeInsets.only(right: 0.0, left: 0.0, top: 10.0),
      child: ElevatedButton(
      style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.only(right: 70.0, left: 70.0, top: 10.0, bottom: 10.0 ),
      shape: styles.circleBtn(),
      elevation: 0.0,
      primary: Colors.white,

      )
      onPressed:()=>Register() ,
      child: Text('Register',style: styles.startBtn, textAlign: TextAlign.center),
      ),
      ),
      const SizedBox(height: 100.0,),
      ],
      ),
      ],

      ),
      )
      ),
      ),

      ],
      ),

      );
  }
}
