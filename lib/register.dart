import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';


class Register extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _RegisterState();
  }

}

class _RegisterState extends State<Register>{

  final TextEditingController _getuserName = TextEditingController();
  final TextEditingController _getEmailAddress = TextEditingController();
  final TextEditingController _getMobileNumber = TextEditingController();
  final TextEditingController _getPassword = TextEditingController();
  late String theLanguage;
  late TextAlign theAlignment;
  late String mytoken = '';
  late String deviceId;
  late bool contractCheck = false;

  bool _isObscure = true;



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      key: scaffoldKey,
      body: Stack(
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
              child: GestureDetector(
                onTap: ()=> FocusScope.of(context).requestFocus(FocusNode()),
                child: Form(

                  child: ListView(
                    keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            IconButton(
                              onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => Login()),),
                              icon: const Icon(Icons.arrow_back_ios),
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Image.asset(
                          'images/logo.png',
                          width: 170.0,
                        ),
                      ),
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
                          child: Column(
                            children: <Widget>[
                              const Padding(padding: EdgeInsets.only(top: 30.0)),
                              Text(context.localeString('register_page_title'), style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 19.0), textAlign: TextAlign.center),
                              Container(
                                padding: const EdgeInsets.only(right: 20.0, left: 20.0, top: 30.0),

                                  autocorrect: false,
                                  style: styles.inputTextStyle,
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    border: UnderlineInputBorder(borderRadius:BorderRadius.circular(7.0)),
                                    prefixIcon: const  Icon(Icons.person, color: Colors.black54),
                                    hintText: context.localeString(user_name').toString(), hintStyle:  styles.inputTextHintStyle,
                                    fillColor: Colors.white70,
                                    filled: true,
                                  ),
                                  controller: _getuserNameName,
                                  keyboardType: TextInputType.text,
                                  maxLines: 1,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(right: 20.0, left: 20.0, top: 30.0),
                                child: TextFormField(
                                  validator: (value) {
                                    Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                    RegExp regex = RegExp(pattern.toString());

                                  autocorrect: false,
                                  style: styles.inputTextStyle,
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    border: UnderlineInputBorder(borderRadius:BorderRadius.circular(7.0)),
                                    prefixIcon: const Icon(Icons.email, color: Colors.black54),
                                    hintText: context.localeString('email_address').toString(), hintStyle:  styles.inputTextHintStyle,
                                    fillColor: Colors.white70,
                                    filled: true,
                                  ),
                                  controller: _getEmailAddress,
                                  keyboardType: TextInputType.emailAddress,
                                  maxLines: 1,
                                ),
                              ),

                              Container(
                                padding: const EdgeInsets.only(right: 20.0, left: 20.0, top: 30.0),
                                child: TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return context.localeString('field_is_empty').toString();
                                    }else if(value.length < 6) {
                                      return context.localeString('password_must_more_six').toString();
                                    }
                                    return null;
                                  },
                                  autocorrect: false,
                                  style: styles.inputTextStyle,
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    border: UnderlineInputBorder(borderRadius:BorderRadius.circular(7.0)),
                                    prefixIcon: const Icon(Icons.lock, color: Colors.black54),
                                    hintText: context.localeString('password').toString(), hintStyle:  styles.inputTextHintStyle,
                                    fillColor: Colors.white70,
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
                                    if(contractCheck == true){
                                      if (_formKey.currentState!.validate()) {
                                        checkAccount();
                                      }
                                    }else{
                                      null;
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.only(right: 20.0, left: 20.0, top: 5.0, bottom: 5.0 ),
                                    shape: styles.circleBtn(),
                                    primary: contractCheck == false ? Colors.grey : Theme.of(context).secondaryHeaderColor,
                                    elevation: 0.0,

                                  ),
                                  child: Text(context.localeString('register_btn'),style: Theme.of(context).textTheme.button, textAlign: TextAlign.center),
                                ),
                              ),
                              const Padding(padding: EdgeInsets.only(top: 30.0)),
                            ],
                          ),
                        ),
                      ),


                      const Padding(padding: EdgeInsets.only(bottom: 50.0)),
                    ],
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }

}