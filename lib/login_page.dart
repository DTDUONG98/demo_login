import 'package:demo_login/size_config.dart';
import 'package:flutter/material.dart';

import 'components/default_button.dart';
import 'components/default_textfield.dart';
import 'constan.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email;
  String _password;
  String _tokenFCM = '';
  bool _showPass = false;

  // static String routeName = "/sign_in";
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[100],
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () => Navigator.pop(context)),
          title: Text('LOGIN', style: TextStyle(color: Colors.black),),
          centerTitle: true,
          elevation: 0,
        ),
        backgroundColor: Colors.grey[100],
        body: SafeArea(
            child: SizedBox(
                width: double.infinity,
                child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getPropotionateScreenWitdh(20)),
                    child: SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            SizedBox(height: getProportionateScreenHeight(50)),
                            AspectRatio(
                                aspectRatio: 1.1/1,
                                child: Container(
                                    margin: EdgeInsets.all(
                                        20.0
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100.0),
                                        boxShadow:[
                                          BoxShadow(
                                              color: Color.fromARGB(60, 0, 0, 0),
                                              blurRadius: 10.0,
                                              offset: Offset(5.0, 5.0)
                                          )
                                        ],
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage('https://via.placeholder.com/150'),
                                        )
                                    )
                                )
                            ),
                            SizedBox(height: getProportionateScreenHeight(50)),
                            Container(
                              width: SizeConfig.screenWidth * 0.9,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: DefaultTextfield(
                                type: TextInputType.emailAddress,
                                isPassword: false,
                                textHint: 'Enter your Name',
                                textLabel: 'Name',
                                functionValidator: (value) {
                                  if (value.isEmpty) {
                                    addError(error: kEmailNullError);
                                  } else if (!emailValidatorRegExp.hasMatch(value)) {
                                    addError(error: kInvalidEmailError);
                                  }
                                  return null;
                                },
                                functionOnchanged: (value) {
                                  if (value.isNotEmpty) {
                                    removeError(error: kEmailNullError);
                                  } else if (emailValidatorRegExp.hasMatch(value)) {
                                    removeError(error: kInvalidEmailError);
                                  }
                                  return null;
                                },
                                functionOnSave: (newValue) {
                                  _email = newValue;
                                },
                              ),
                            ),
                            SizedBox(height: getProportionateScreenHeight(10)),
                            Container(
                              width: SizeConfig.screenWidth * 0.9,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: DefaultTextfield(
                                isPassword: false,
                                textHint: 'Enter your Age',
                                textLabel: 'Age',
                                functionValidator: (value) {
                                  if (value.isEmpty) {
                                    addError(error: kPassNullError);
                                  } else if (value.length < 6) {
                                    addError(error: kShortPassError);
                                  }
                                  return null;
                                },
                                functionOnchanged: (value) {
                                  if (value.isNotEmpty) {
                                    removeError(error: kPassNullError);
                                  } else if (value.length >= 8) {
                                    removeError(error: kShortPassError);
                                  }
                                  return null;
                                },
                                functionOnSave: (newValue) {
                                  _password = newValue;
                                },
                              ),
                            ),
                            SizedBox(height: getProportionateScreenHeight(10)),
                            Container(
                              width: SizeConfig.screenWidth * 0.9,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: DefaultTextfield(
                                type: TextInputType.emailAddress,
                                isPassword: false,
                                textHint: 'Enter your address',
                                textLabel: 'address',
                                functionValidator: (value) {
                                  if (value.isEmpty) {
                                    addError(error: kEmailNullError);
                                  } else if (!emailValidatorRegExp.hasMatch(value)) {
                                    addError(error: kInvalidEmailError);
                                  }
                                  return null;
                                },
                                functionOnchanged: (value) {
                                  if (value.isNotEmpty) {
                                    removeError(error: kEmailNullError);
                                  } else if (emailValidatorRegExp.hasMatch(value)) {
                                    removeError(error: kInvalidEmailError);
                                  }
                                  return null;
                                },
                                functionOnSave: (newValue) {
                                  _email = newValue;
                                },
                              ),
                            ),
                            SizedBox(height: getProportionateScreenHeight(10)),
                            Container(
                              width: SizeConfig.screenWidth * 0.9,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: DefaultTextfield(
                                type: TextInputType.emailAddress,
                                isPassword: false,
                                textHint: 'Enter your CMND/CCCD',
                                textLabel: 'CMND',
                                functionValidator: (value) {
                                  if (value.isEmpty) {
                                    addError(error: kEmailNullError);
                                  } else if (!emailValidatorRegExp.hasMatch(value)) {
                                    addError(error: kInvalidEmailError);
                                  }
                                  return null;
                                },
                                functionOnchanged: (value) {
                                  if (value.isNotEmpty) {
                                    removeError(error: kEmailNullError);
                                  } else if (emailValidatorRegExp.hasMatch(value)) {
                                    removeError(error: kInvalidEmailError);
                                  }
                                  return null;
                                },
                                functionOnSave: (newValue) {
                                  _email = newValue;
                                },
                              ),
                            ),
                            SizedBox(height: getProportionateScreenHeight(10)),
                            Container(
                              width: SizeConfig.screenWidth * 0.9,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: DefaultTextfield(
                                type: TextInputType.emailAddress,
                                isPassword: false,
                                textHint: 'Enter your phone',
                                textLabel: 'Phone',
                                functionValidator: (value) {
                                  if (value.isEmpty) {
                                    addError(error: kEmailNullError);
                                  } else if (!emailValidatorRegExp.hasMatch(value)) {
                                    addError(error: kInvalidEmailError);
                                  }
                                  return null;
                                },
                                functionOnchanged: (value) {
                                  if (value.isNotEmpty) {
                                    removeError(error: kEmailNullError);
                                  } else if (emailValidatorRegExp.hasMatch(value)) {
                                    removeError(error: kInvalidEmailError);
                                  }
                                  return null;
                                },
                                functionOnSave: (newValue) {
                                  _email = newValue;
                                },
                              ),
                            ),
                            SizedBox(height: getProportionateScreenHeight(30)),
                            DefaultButton(
                                text: 'SUBMIT',
                                height: 56,
                                press: () {
                                  // if (_formKey.currentState.validate()) {
                                  //   _formKey.currentState.save();
                                  //   // if all are valid then go to home screen

                                  // }
                                }),
                            // Spacer()
                          ],
                        ),
                      ),
                    )))));
  }
}
