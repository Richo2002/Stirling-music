import 'package:first/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:first/pages/common/theme_helper.dart';
import 'package:first/pages/widgets/header_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:first/theme/colors.dart';
import 'package:toast/toast.dart';
import 'package:first/models/user.dart';
import 'profile_page.dart';

class RegistrationPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
     return _RegistrationPageState();
  }
}

class _RegistrationPageState extends State<RegistrationPage>{

  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  String? firstName;
  final firstNameController = TextEditingController();

  String? name;
  final nameController = TextEditingController();
  
  String? telephone;
  final telephoneController = TextEditingController();

  String? email;
  final emailController = TextEditingController();

  String? password;
  final passwordController = TextEditingController();
  
  String? typeUser;

  String showType(var priority) {
    String output;
    switch (priority) {
      case 1:
        output = "Low";
        break;
      case 2:
        output = "Normal";
        break;
      case 3:
        output = "High";
        break;
      default:
        output = "Normal";
    }

    return output;
  }

  _showMsg(msg) {
    Toast.show(
        msg,
        duration: Toast.lengthLong,
        gravity:  Toast.bottom
    );
  }
  
  _saveUser() async{
    if (_formKey.currentState!.validate()) {
      isLoading = true;
      User user = User.withBody(firstName, name, telephone, email, password);

      user.save().then((value) {
        if(value) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
        } else {
          //_showMsg("An error is occured.");
        }
      });
    } else {
      isLoading = false;
     // _showMsg("Some field is missed.");
    }
  }

  @override
  void initState() {
    super.initState();

    setState(() {
      
    });
  }

  bool checkedValue = false;
  bool checkboxValue = false;

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
            image: AssetImage("assets/app/f3.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Container(
              height: 200,
              child: HeaderWidget(200, true, Icons.person_add_alt_1_rounded),
            ),
            SafeArea(
              child: Container(
              margin: EdgeInsets.fromLTRB(25, 0, 25, 0),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              alignment: Alignment.center, 
                child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(height: 30,),
                        Container(
                          child: TextFormField(
                            controller: firstNameController,
                            decoration: ThemeHelper().textInputDecoration('Prénom', 'Entrez votre prénom', Icons.person),
                            validator: (firstNameValue) {
                              if (firstNameValue!.isEmpty) {
                                return 'This field is required';
                              }
                              firstName = firstNameValue;
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 30,),
                        Container(
                          child: TextFormField(
                            controller: nameController,
                            decoration: ThemeHelper().textInputDecoration('Nom', 'Entrez votre nom', Icons.person),
                            validator: (nameValue) {
                              if (nameValue!.isEmpty) {
                                return 'This field is required';
                              }
                              name = nameValue;
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            decoration: ThemeHelper().textInputDecoration('Email', 'Entrez votre email', Icons.mail_rounded),
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                            validator: (emailValue) {
                              if(!(emailValue!.isEmpty) && !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$").hasMatch(emailValue)){
                                return "Entrez une adresse e-mail valide";
                              }
                              email = emailValue;
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            decoration: ThemeHelper().textInputDecoration(
                                "Numéro de portable",
                                "Entrez votre numéro de mobile", Icons.phone),
                            keyboardType: TextInputType.phone,
                            controller: telephoneController,
                            validator: (telephoneValue) {
                              if(!(telephoneValue!.isEmpty) && !RegExp(r"^(\d+)*$").hasMatch(telephoneValue)){
                                return "Entrez un numéro de téléphone valide";
                              }
                              telephone = telephoneValue;
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            obscureText: true,
                            controller: passwordController,
                            decoration: ThemeHelper().textInputDecoration(
                                "Mot de passe*", "Entrez votre mot de passe", Icons.key),
                            validator: (passwordValue) {
                              if (passwordValue!.isEmpty) {
                                return "S'il vous plait entrez votre mot de passe";
                              }
                              password = passwordValue;
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 15.0),
                        FormField<bool>(
                          builder: (state) {
                            return Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Checkbox(
                                        value: checkboxValue,
                                        onChanged: (value) {
                                          setState(() {
                                            checkboxValue = value!;
                                            state.didChange(value);
                                          });
                                        }),
                                    Text("J'accepte tous les termes et conditions.", style: TextStyle(color: Colors.grey),),
                                  ],
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    state.errorText ?? '',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(color: Theme.of(context).errorColor,fontSize: 12,),
                                  ),
                                )
                              ],
                            );
                          },
                          validator: (value) {
                            if (!checkboxValue) {
                              return "Vous devez accepter les termes et conditions";
                            } else {
                              return null;
                            }
                          },
                        ),
                        Container(
                          decoration: ThemeHelper().buttonBoxDecoration(context),
                          child: ElevatedButton(
                            style: ThemeHelper().buttonStyle(),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                              child: Text(
                                "S'inscrire",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onPressed: () {
                              _saveUser();
                            },
                          ),
                        ),
                        SizedBox(height: 20.0),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]
      ),
    ),
    );
  }
}