import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'forgot_password_page.dart';
import 'registration_page.dart';
import 'widgets/header_widget.dart';
import 'package:first/pages/common/theme_helper.dart';
import 'package:first/theme/colors.dart';
import 'package:toast/toast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:first/models/user.dart';
import 'package:first/sidebar/sidebar_layout.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double _headerHeight = 200;
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<FormFieldState<String>> _passwordFieldKey = GlobalKey<FormFieldState<String>>();

  bool isLoading = false;

  String? email;
  final emailController = TextEditingController();

  String? password;
  final passwordController = TextEditingController();

  _showMsg(msg) {
    Toast.show(
      msg,
      duration: Toast.lengthLong,
      gravity:  Toast.bottom
    );
  }

  _login() async{
    if (_formKey.currentState!.validate()) {
      isLoading = true;

      var user = await User.getUserFromStorage();
      if(user == null) {
        _showMsg("You don't have an account.");
      } else if(email == user.email && password == user.password) {
        user.connected = true;
        user.save().then((value) {
          if(value) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => SideBarLayout()));
          }
        });
      }
    } else {
      isLoading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody() {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/app/f1.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Container(
              height: _headerHeight,
              child: HeaderWidget(_headerHeight, true, Icons.login_rounded),
            ),
            SingleChildScrollView(
            child: SafeArea(
              child: Container( 
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Column(
                  children: [
                    Text(
                      'Connectez-vous à votre compte',
                      style: TextStyle(color: Colors.grey, fontSize: 25),
                    ),
                    SizedBox(height: 30.0),
                    Form(
                      key: _formKey,
                        child: Column(
                          children: [
                            Container(
                              child: TextFormField(
                                decoration: ThemeHelper().textInputDecoration('Email', 'Entrez votre email', Icons.mail_rounded),
                                controller: emailController,
                                validator: (emailValue) {
                                  if (emailValue!.isEmpty) {
                                    return 'This field is required';
                                  }
                                  email = emailValue;
                                  return null;
                                },
                              ),
                              decoration: ThemeHelper().inputBoxDecorationShaddow(),
                            ),
                            SizedBox(height: 30.0),
                            Container(
                              child: TextFormField(
                                obscureText: true,
                                decoration: ThemeHelper().textInputDecoration('Mot de passe', 'Entrez votre mot de passe', Icons.key),
                                controller: passwordController,
                                validator: (passwordValue) {
                                  if (passwordValue!.isEmpty) {
                                    return 'This field is required';
                                  }
                                  password = passwordValue;
                                  return null;
                                },
                              ),
                              decoration: ThemeHelper().inputBoxDecorationShaddow(),
                            ),
                            SizedBox(height: 15.0),
                            Container(
                              margin: EdgeInsets.fromLTRB(10,0,10,20),
                              alignment: Alignment.topRight,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push( context, MaterialPageRoute( builder: (context) => ForgotPasswordPage()), );
                                },
                                child: Text( "Mot de passe oublié ?", style: TextStyle( color: black, ),
                                ),
                              ),
                            ),
                            Container(
                              decoration: ThemeHelper().buttonBoxDecoration(context),
                              child: ElevatedButton(
                                style: ThemeHelper().buttonStyle(),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                                  child: Text('S\'identifier', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                                ),
                                onPressed: () {
                                  _login();
                                },
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(10,20,10,20),
                              //child: Text('Don\'t have an account? Create'),
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(text: "Vous n'avez pas de compte ? "),
                                    TextSpan(
                                      text: 'Créer',
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationPage()));
                                        },
                                      style: TextStyle(fontWeight: FontWeight.bold, color: primary),
                                    ),
                                  ]
                                )
                              ),
                            ),
                          ],
                        )
                    ),
                  ],
                )
              ),
            ),),
          ],
        ),
    );
  }
}