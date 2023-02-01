import 'dart:ui';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Login extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _LoginState();
  }

}

class _LoginState extends State<Login>{

  final TextEditingController _getMobileNumber = TextEditingController();
  final TextEditingController _getPassword = TextEditingController();
  late String theLanguage;
  late String deviceId;
  late TextAlign theAlignment;
  String loginType = 'member';
  String mytoken = '';


  bool _isObscure = true;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      key: scaffoldKey,

      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            color: Theme.of(context).primaryColor,
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 2.0,
                sigmaY: 2.0,
              ),
              child: Container(
                child: ListView(
                  keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 15.0, top:20.0, right: 15.0),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        'images/person.png',
                        width: 180.0,
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 0.0)),
                    Card(
                      margin: const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 20.0),
                      elevation: 5,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(50),
                              bottomRight: Radius.circular(10),
                              bottomLeft: Radius.circular(50)),
                          side: BorderSide(width: 1, color: Colors.white24)
                      ),
                      child: Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Column(
                          children: [
                            const Padding(padding: EdgeInsets.only(top: 30.0)),
                            Text(context.localeString('login_page_title'), style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 19.0), textAlign: TextAlign.center),

                            Container(
                              padding: const EdgeInsets.only(right: 20.0, left: 20.0, top: 30.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.only(right: 20.0, left: 20.0, top: 5.0, bottom: 5.0 ),
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(0.0),
                                              bottomRight: Radius.circular(0.0),
                                              topLeft: Radius.circular(0.0),
                                              bottomLeft: Radius.circular(0.0),
                                            )
                                        ),
                                        primary: loginType == 'store' ? Theme.of(context).secondaryHeaderColor: const Color.fromRGBO(230,230,230,1),
                                        elevation: 0.0,

                                      ),
                                      onPressed: ()=> changeLoginType('store'),
                                      child: Text(context.localeString('store_btn'),style: loginType == 'store' ? styles.activeBtn:styles.inActiveBtn, textAlign: TextAlign.center),

                                    ),
                                  ),
                                  Expanded(
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: loginType == 'member' ? Theme.of(context).secondaryHeaderColor: const Color.fromRGBO(230,230,230,1),
                                        padding: const EdgeInsets.only(right: 20.0, left: 20.0, top: 5.0, bottom: 5.0 ),
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(0.0),
                                              bottomRight: Radius.circular(0.0),
                                              topLeft: Radius.circular(0.0),
                                              bottomLeft: Radius.circular(0.0),
                                            )
                                        ),
                                        elevation: 0.0,


                                      ),
                                      onPressed: ()=> changeLoginType('member'),
                                      child: Text(context.localeString('member_btn'), style: loginType == 'member' ? styles.activeBtn:styles.inActiveBtn, textAlign: TextAlign.center),

                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Container(
                              padding: const EdgeInsets.only(right: 20.0, left: 20.0, top: 30.0),
                              child: TextField(
                                autocorrect: false,
                                style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.w300),
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  border: UnderlineInputBorder(borderRadius:BorderRadius.circular(7.0)),
                                  prefixIcon: const Icon(Icons.phone_iphone, color: Colors.black54),
                                  hintText: ''.toString(), hintStyle:  styles.inputTextHintStyle,
                                  fillColor: Colors.white70,
                                  hintTextDirection: TextDirection.ltr,
                                  filled: true,
                                ),
                                controller: _getMobileNumber,
                                keyboardType: TextInputType.phone,
                                maxLines: 1,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(right: 20.0, left: 20.0, top: 30.0),
                              child: TextField(
                                autocorrect: false,
                                style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.w300),
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  border: UnderlineInputBorder(borderRadius:BorderRadius.circular(7.0)),
                                  prefixIcon: const Icon(Icons.lock, color: Colors.black54,),
                                  hintText: context.localeString('password').toString(), hintStyle:  styles.inputTextHintStyle,
                                  fillColor: Colors.transparent,
                                  filled: true,
                                  suffixIcon: IconButton(
                                      icon: Icon(
                                        _isObscure ? Icons.visibility_off : Icons.visibility, color: Colors.black54,),
                                      onPressed: () {
                                        setState(() {
                                          _isObscure = !_isObscure;
                                        });
                                      }),
                                ),
                                controller: _getPassword,
                                obscureText: _isObscure,
                                keyboardType: TextInputType.text,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(right: 40.0, left: 40.0, top: 20.0),
                              child: ElevatedButton(
                                onPressed: (){
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.only(right: 20.0, left: 20.0, top: 5.0, bottom: 5.0 ),
                                  shape: styles.circleBtn(),
                                  elevation: 0.0,
                                  primary: Theme.of(context).secondaryHeaderColor,


                                ),
                                child: Text(context.localeString('login_btn'),style: Theme.of(context).textTheme.button, textAlign: TextAlign.center),
                              ),
                            ),
                            const Padding(padding: EdgeInsets.only(top: 30.0)),
                          ],
                        ),
                      ),
                    ),

                    Row(
                      children: [
                        Expanded(
                          child: Container(),
                        ),
                        Container(
                            child: ElevatedButton(
                              child: Text(context.localeString('do_not_have_account'), style: const TextStyle(color: Colors.white, fontSize: 16.0), textAlign: TextAlign.center),
                              onPressed: ()=> Navigator.of(context).pushNamedAndRemoveUntil('/Register',(Route<dynamic> route) => false),
                            )
                        ),

                        Expanded(
                          child: Container(),
                        ),
                      ],
                    ),

                    const Padding(padding: EdgeInsets.only(bottom: 20.0)),

                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }

}