import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:ssip_hackathon_project/variables.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';




void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'READ IT!',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        fontFamily: 'comic',
      ),
      //home:  ,
      initialRoute: '/loading2',
      routes: {
        '/login': (context) => const MyLoginScreen(),
        '/home': (context) => const MyHomePage(title: 'READ IT!'),
        '/signup': (context) => const MySignUpScreen(),
        '/resetpassword': (context) => const MyResetPasswordScreen(),
        '/loading': (context) => const LoadingScreen(),
        '/loading2': (context) => const LoadingScreen2(),
        '/profile': (context) => const ProfilePage(),
        '/owned': (context) => const OwnedPage(),
        '/pdf': (context) => const MyPDFScreen(),
        '/productdetails': (context) => const ProductDetailsPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

//LoginScreen
class MyLoginScreen extends StatefulWidget {
  const MyLoginScreen({Key? key}) : super(key: key);

  @override
  State<MyLoginScreen> createState() => LoginScreen();
}

class LoginScreen extends State<MyLoginScreen> {
  final FocusNode focusNodeUsername = FocusNode();
  final FocusNode focusNodePassword = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey();

  String username = "";
  String password = "";

  @override
  void initState() {
    super.initState();
    focusNodeUsername.addListener(() {
      setState(() {});
    });

    focusNodePassword.addListener(() {
      setState(() {});
    });
  }

  //void _submit() {
  //placeholder
  //}

  late final Future myFuture = decode();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: myFuture, // function where you call your api
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if( snapshot.connectionState == ConnectionState.waiting){
          return const Center(child: Text('Please wait its loading...'));
        }else{
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            dynamic usertext = '${snapshot.data}';
            return Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: const Color(0x44aaaaff),
          title: const Text('Login', style: TextStyle(fontFamily: 'comic', color: Colors.blue,fontWeight: FontWeight.bold)),
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.blue),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25)),
          ),
        ),
        body: Container(
          height: 200,
          width: double.infinity,
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
                image: AssetImage("assets/images/BG1Cropped.jpg"),
                fit: BoxFit.cover),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.fromLTRB(80, 80, 80, 80),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/finallogo3.png"),
                  ),
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: TextFormField(
                        style: const TextStyle(color: Color(0xFFFF8F00)),
                        keyboardType: TextInputType.emailAddress,
                        onFieldSubmitted: (value) {
                          setState(() {
                            username = value;
                          });
                        },
                        validator: (value) {
                          if (value!.isEmpty || !value.contains('@')) {
                          }
                          return null;
                        },
                        focusNode: focusNodeUsername,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color(0x44aaaaff),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(90.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Color(0xFFFF8F00)),
                              borderRadius: BorderRadius.circular(90.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.circular(90.0),
                            ),
                            labelText: usertext,
                            labelStyle: TextStyle(fontFamily: 'comic', color: focusNodeUsername.hasFocus ? Colors.amber[800] : Colors.blue,fontWeight: FontWeight.bold)
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: TextFormField(
                        style: const TextStyle(color: Color(0xFFFF8F00)),
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty && value.length < 8) {
                          }
                          return null;
                        },
                        onFieldSubmitted: (value) {
                          setState(() {
                            password = value;
                          });
                        },
                        focusNode: focusNodePassword,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color(0x44aaaaff),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(90.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Color(0xFFFF8F00)),
                              borderRadius: BorderRadius.circular(90.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.circular(90.0),
                            ),
                            labelText: 'Password',
                            labelStyle: TextStyle(fontFamily: 'comic', color: focusNodePassword.hasFocus ? Colors.amber[800] : Colors.blue,fontWeight: FontWeight.bold)
                        ),
                      ),
                    ),
                    Container(
                        height: 80,
                        padding: const EdgeInsets.all(20),
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(const Color(0x44aaaaff)),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: const BorderSide(color: Colors.blue)
                                  )
                              )
                          ),
                          child: const Text('Log In', style: TextStyle(fontFamily: 'comic', color: Colors.blue,fontWeight: FontWeight.bold)),
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, '/home');
                          },
                        )
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/resetpassword');
                },
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color(0x44aaaaff))),
                child: const Text('Forgot Password?',
                    style: TextStyle(fontFamily: 'comic', color: Color(0xFFFF8F00),fontWeight: FontWeight.bold)
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/signup');
                },
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color(0x44aaaaff))),
                child: const Text("Don't Have An Account? Create One!",
                    style: TextStyle(fontFamily: 'comic', color: Color(0xFFFF8F00),fontWeight: FontWeight.bold)
                ),
              ),
            ],
          ),
        )
    );
          }
        }
      },
    );
  }
}



//SignUpScreen
class MySignUpScreen extends StatefulWidget {
  const MySignUpScreen({Key? key}) : super(key: key);

  @override
  State<MySignUpScreen> createState() => SignUpScreen();
}

class SignUpScreen extends State<MySignUpScreen> {
  final FocusNode focusNodeEmailID = FocusNode();
  final FocusNode focusNodeUsername1 = FocusNode();
  final FocusNode focusNodePassword1 = FocusNode();
  final FocusNode focusNodeConfirmPassword = FocusNode();
  final GlobalKey<FormState> _formKey1 = GlobalKey();
  String emailid = "";
  String username1 = "";
  String password1 = "";
  String confirmpassword = "";

  @override
  void initState() {
    super.initState();
    focusNodeEmailID.addListener(() {
      setState(() {});
    });

    focusNodeUsername1.addListener(() {
      setState(() {});
    });

    focusNodePassword1.addListener(() {
      setState(() {});
    });

    focusNodeConfirmPassword.addListener(() {
      setState(() {});
    });
  }

  //void _submit1() {
  //placeholder

  //}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: const Color(0x44aaaaff),
          title: const Text('Sign Up', style: TextStyle(fontFamily: 'comic', color: Colors.blue,fontWeight: FontWeight.bold)),
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.blue),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25)),
          ),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.arrow_back_rounded),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/login');
                },
                tooltip: 'Go Back',
              );
            },
          ),
        ),
        body: Container(
          height: 200,
          width: double.infinity,
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
                image: AssetImage("assets/images/BG1Cropped.jpg"),
                fit: BoxFit.cover),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.fromLTRB(80, 80, 80, 80),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/finallogo3.png"),
                  ),
                ),
              ),
              Form(
                key: _formKey1,
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: TextFormField(
                        style: const TextStyle(color: Color(0xFFFF8F00)),
                        keyboardType: TextInputType.emailAddress,
                        onFieldSubmitted: (value) {
                          setState(() {
                            emailid = value;
                          });
                        },
                        validator: (value) {
                          if (value!.isEmpty || !value.contains('@')) {
                          }
                          return null;
                        },
                        focusNode: focusNodeEmailID,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color(0x44aaaaff),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(90.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Color(0xFFFF8F00)),
                              borderRadius: BorderRadius.circular(90.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.circular(90.0),
                            ),
                            labelText: 'Email ID',
                            labelStyle: TextStyle(fontFamily: 'comic', color: focusNodeEmailID.hasFocus ? Colors.amber[800] : Colors.blue,fontWeight: FontWeight.bold)
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: TextFormField(
                        style: const TextStyle(color: Color(0xFFFF8F00)),
                        keyboardType: TextInputType.text,
                        onFieldSubmitted: (value) {
                          setState(() {
                            username1 = value;
                          });
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                          }
                          return null;
                        },
                        focusNode: focusNodeUsername1,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color(0x44aaaaff),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(90.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Color(0xFFFF8F00)),
                              borderRadius: BorderRadius.circular(90.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.circular(90.0),
                            ),
                            labelText: 'Username',
                            labelStyle: TextStyle(fontFamily: 'comic', color: focusNodeUsername1.hasFocus ? Colors.amber[800] : Colors.blue,fontWeight: FontWeight.bold)
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: TextFormField(
                        style: const TextStyle(color: Color(0xFFFF8F00)),
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty && value.length < 8) {
                          }
                          return null;
                        },
                        onFieldSubmitted: (value) {
                          setState(() {
                            password1 = value;
                          });
                        },
                        focusNode: focusNodePassword1,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color(0x44aaaaff),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(90.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Color(0xFFFF8F00)),
                              borderRadius: BorderRadius.circular(90.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.circular(90.0),
                            ),
                            labelText: 'Password',
                            labelStyle: TextStyle(fontFamily: 'comic', color: focusNodePassword1.hasFocus ? Colors.amber[800] : Colors.blue,fontWeight: FontWeight.bold)
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: TextFormField(
                        style: const TextStyle(color: Color(0xFFFF8F00)),
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty && value == password1) {
                          }
                          return null;
                        },
                        onFieldSubmitted: (value) {
                          setState(() {
                            confirmpassword = value;
                          });
                        },
                        focusNode: focusNodeConfirmPassword,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color(0x44aaaaff),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(90.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Color(0xFFFF8F00)),
                              borderRadius: BorderRadius.circular(90.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.circular(90.0),
                            ),
                            labelText: 'Confirm Password',
                            labelStyle: TextStyle(fontFamily: 'comic', color: focusNodeConfirmPassword.hasFocus ? Colors.amber[800] : Colors.blue,fontWeight: FontWeight.bold)
                        ),
                      ),
                    ),
                    Container(
                        height: 80,
                        padding: const EdgeInsets.all(20),
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(const Color(0x44aaaaff)),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: const BorderSide(color: Colors.blue)
                                  )
                              )
                          ),
                          child: const Text('Sign Up', style: TextStyle(fontFamily: 'comic', color: Colors.blue,fontWeight: FontWeight.bold)),
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, '/home');
                          },
                        )
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/login');
                },
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color(0x44aaaaff))),
                child: const Text("Already Have An Account? Log In!",
                    style: TextStyle(fontFamily: 'comic', color: Color(0xFFFF8F00),fontWeight: FontWeight.bold)
                ),
              ),
            ],
          ),
        )
    );
  }
}



//ResetPasswordScreen
class MyResetPasswordScreen extends StatefulWidget {
  const MyResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<MyResetPasswordScreen> createState() => ResetPasswordScreen();
}

class ResetPasswordScreen extends State<MyResetPasswordScreen> {
  final FocusNode focusNodeConfirmEmailID = FocusNode();
  final FocusNode focusNodeResetPassword = FocusNode();
  final FocusNode focusNodeConfirmResetPassword = FocusNode();
  final GlobalKey<FormState> _formKey2 = GlobalKey();
  String confirmemailid = "";
  String resetpassword = "";
  String confirmresetpassword = "";

  @override
  void initState() {
    super.initState();
    focusNodeConfirmEmailID.addListener(() {
      setState(() {});
    });

    focusNodeResetPassword.addListener(() {
      setState(() {});
    });

    focusNodeConfirmResetPassword.addListener(() {
      setState(() {});
    });
  }

  //void _submit1() {
  //placeholder
  //}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: const Color(0x44aaaaff),
          title: const Text('Reset Password', style: TextStyle(fontFamily: 'comic', color: Colors.blue,fontWeight: FontWeight.bold)),
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.blue),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25)),
          ),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.arrow_back_rounded),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/login');
                },
                tooltip: 'Go Back',
              );
            },
          ),
        ),
        body: Container(
          height: 200,
          width: double.infinity,
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
                image: AssetImage("assets/images/BG1Cropped.jpg"),
                fit: BoxFit.cover),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.fromLTRB(80, 80, 80, 80),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/finallogo3.png"),
                  ),
                ),
              ),
              Form(
                key: _formKey2,
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: TextFormField(
                        style: const TextStyle(color: Color(0xFFFF8F00)),
                        keyboardType: TextInputType.emailAddress,
                        onFieldSubmitted: (value) {
                          setState(() {
                            confirmemailid = value;
                          });
                        },
                        validator: (value) {
                          if (value!.isEmpty || !value.contains('@')) {
                          }
                          return null;
                        },
                        focusNode: focusNodeConfirmEmailID,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color(0x44aaaaff),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(90.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Color(0xFFFF8F00)),
                              borderRadius: BorderRadius.circular(90.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.circular(90.0),
                            ),
                            labelText: 'Confirm Email ID',
                            labelStyle: TextStyle(fontFamily: 'comic', color: focusNodeConfirmEmailID.hasFocus ? Colors.amber[800] : Colors.blue,fontWeight: FontWeight.bold)
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: TextFormField(
                        style: const TextStyle(color: Color(0xFFFF8F00)),
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty && value.length < 8) {
                          }
                          return null;
                        },
                        onFieldSubmitted: (value) {
                          setState(() {
                            resetpassword = value;
                          });
                        },
                        focusNode: focusNodeResetPassword,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color(0x44aaaaff),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(90.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Color(0xFFFF8F00)),
                              borderRadius: BorderRadius.circular(90.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.circular(90.0),
                            ),
                            labelText: 'New Password',
                            labelStyle: TextStyle(fontFamily: 'comic', color: focusNodeResetPassword.hasFocus ? Colors.amber[800] : Colors.blue,fontWeight: FontWeight.bold)
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: TextFormField(
                        style: const TextStyle(color: Color(0xFFFF8F00)),
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: false,
                        validator: (value) {
                          if (value!.isEmpty && value == resetpassword) {
                          }
                          return null;
                        },
                        onFieldSubmitted: (value) {
                          setState(() {
                            confirmresetpassword = value;
                          });
                        },
                        focusNode: focusNodeConfirmResetPassword,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color(0x44aaaaff),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(90.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Color(0xFFFF8F00)),
                              borderRadius: BorderRadius.circular(90.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.circular(90.0),
                            ),
                            labelText: 'Confirm New Password',
                            labelStyle: TextStyle(fontFamily: 'comic', color: focusNodeConfirmResetPassword.hasFocus ? Colors.amber[800] : Colors.blue,fontWeight: FontWeight.bold)
                        ),
                      ),
                    ),
                    Container(
                        height: 80,
                        padding: const EdgeInsets.all(20),
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(const Color(0x44aaaaff)),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: const BorderSide(color: Colors.blue)
                                  )
                              )
                          ),
                          child: const Text('Reset Password', style: TextStyle(fontFamily: 'comic', color: Colors.blue,fontWeight: FontWeight.bold)),
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, '/login');
                          },
                        )
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}

//HomeScreen
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/HomeBG.jpg"),
            fit: BoxFit.cover),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(80, 80, 80, 80),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/finallogo3.png"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//EnglishScreen
class EnglishScreen extends StatelessWidget {
  const EnglishScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/BG9.jpg"),
            fit: BoxFit.cover),
      ),
    );
  }
}

//HindiScreen
class HindiScreen extends StatelessWidget {
  const HindiScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/BG1.jpg"),
            fit: BoxFit.cover),
      ),
    );
  }
}

//GujaratiScreen
class GujaratiScreen extends StatelessWidget {
  const GujaratiScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/BG8.jpg"),
            fit: BoxFit.cover),
      ),
    );
  }
}

//CategoriesScreen
class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/BG2.jpg"),
            fit: BoxFit.cover),
      ),
    );
  }
}

//LoadingScreen
class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/HomeBG.jpg"),
            fit: BoxFit.cover),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(80, 80, 80, 80),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/finallogo3.png"),
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(width: 20.0, height: 100.0),
              const Text(
                'Be',
                style: TextStyle(fontSize: 43.0),
              ),
              const SizedBox(width: 20.0, height: 100.0),
              DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 40.0,
                  fontFamily: 'Horizon',
                ),
                child: AnimatedTextKit(
                  animatedTexts: [
                    RotateAnimatedText('AWESOME'),
                    RotateAnimatedText('OPTIMISTIC'),
                    RotateAnimatedText('DIFFERENT'),
                  ],
                  onTap: () {
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//Search Delegate
class DataSearch extends SearchDelegate {
  final List<ListWords> listWords;
  DataSearch(this.listWords);

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: AppBarTheme(
        color: Colors.blue,
        iconTheme: const IconThemeData(color: Colors.white),
        toolbarTextStyle: const TextTheme(
            titleLarge: TextStyle(
                fontFamily: 'comic',
                color: Colors.white,
                fontWeight: FontWeight.bold)
        ).bodyLarge,
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    //Actions for app bar
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    //leading icon on the left of the app bar
    return IconButton(
      icon: AnimatedIcon(icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // show some result based on the selection
    final suggestionList = listWords;
    return Container(
      height: 200,
      width: double.infinity,
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        color: Colors.black,
        image: DecorationImage(
            image: AssetImage("assets/images/BG1Cropped.jpg"),
            fit: BoxFit.cover
        ),
      ),
      child:  ListView.builder(itemBuilder: (context, index) => ListTile(
        title: Text(listWords[index].authorlist, style: const TextStyle(fontFamily: 'comic', fontSize: 18, color: Color(0xFFFF8F00),fontWeight: FontWeight.bold)),
        subtitle: Text(listWords[index].booklist, style: const TextStyle(fontFamily: 'comic', fontSize: 18, color: Color(0xFFFF8F00),fontWeight: FontWeight.bold)),
        trailing: const Icon(Icons.remove_red_eye, color: Colors.blue,),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SearchResults(listWordsDetail: suggestionList[index]),
            ),
          );
        },
      ),
        itemCount: suggestionList.length,
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when someone searches for something

    final suggestionList = query.isEmpty
        ? listWords
        : listWords.where((p) => p.authorlist.contains(RegExp(query, caseSensitive: false))).toList();

    return Container(
      height: 200,
      width: double.infinity,
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        color: Colors.black,
        image: DecorationImage(
            image: AssetImage("assets/images/BG1Cropped.jpg"),
            fit: BoxFit.cover
        ),
      ),
      child:  ListView.builder(itemBuilder: (context, index) => ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SearchResults(listWordsDetail: suggestionList[index]),
            ),
          );
        },
        trailing: const Icon(Icons.remove_red_eye, color: Colors.blue,),
        title: RichText(
          text: TextSpan(
              text: suggestionList[index].authorlist.substring(0, query.length),
              style: const TextStyle(
                  color: Color(0xFFFF8F00),fontFamily: 'comic', fontSize: 18, fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                    text: suggestionList[index].authorlist.substring(query.length),
                    style: const TextStyle(color: Colors.blue,fontFamily: 'comic', fontSize: 18)),
              ]),
        ),
      ),
        itemCount: suggestionList.length,
      ),
    );
  }
}

//Search Results Page
class SearchResults extends StatelessWidget {

  final ListWords listWordsDetail;

  const SearchResults({super.key, required this.listWordsDetail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: const Color(0x44aaaaff),
          title: const Text('Search Results', style: TextStyle(fontFamily: 'comic', color: Colors.blue,fontWeight: FontWeight.bold)),
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.blue),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25)),
          ),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.arrow_back_rounded),
                onPressed: () {
                  Navigator.pop(context);
                },
                tooltip: 'Go Back',
              );
            },
          ),
        ),
        body: Container(
          height: 200,
          width: double.infinity,
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
                image: AssetImage("assets/images/BG1Cropped.jpg"),
                fit: BoxFit.cover),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(listWordsDetail.authorlist, style: const TextStyle(fontFamily: 'comic', fontSize: 20, color: Colors.blue,fontWeight: FontWeight.bold)),
              Text(listWordsDetail.booklist, style: const TextStyle(fontFamily: 'comic', fontSize: 20, color: Colors.blue,fontWeight: FontWeight.bold)),
            ],
          ),
        )
    );
  }
}


//Search Content
List<ListWords>  listWords = [
  ListWords('HG Wells', 'The Time Machine'),
  ListWords('Arthur Conan Doyle', 'Sherlock Holmes'),
  ListWords('William Shakespeare', 'Romeo And Juliet'),
  ListWords('JK Rowling', 'Harry Potter'),
  ListWords('Mark Twain', 'The Mysterious Stranger'),
  ListWords('George Orwell', 'Why I Write'),
  ListWords('Charles Dickens', 'A Christmas Carol'),
  ListWords('Virginia Woolf', 'To The Lighthouse'),
];

class ListWords {
  String authorlist;
  String booklist;

  ListWords(this.authorlist, this.booklist);
}

//Rating Dialog
final _dialog = RatingDialog(
  initialRating: 1.0,
  title: const Text(
    'READ IT!',
    textAlign: TextAlign.center,
    style: TextStyle(
      fontFamily: 'comic',
      color: Colors.blue,
      fontSize: 25,
      fontWeight: FontWeight.bold,
    ),
  ),
  message: const Text(
    'Rate Us. Your feedback is important!',
    textAlign: TextAlign.center,
    style: TextStyle(color: Colors.blue,fontFamily: 'comic',fontSize: 15,fontWeight: FontWeight.bold,),
  ),
  image: Image.asset("assets/images/finallogo3.png", height: 100,),
  submitButtonText: 'Submit',
  commentHint: 'Leave Your Views Here!',
  //onCancelled: () => ,
  onSubmitted: (response) {
    if (response.rating < 3.0) {
      // send their comments to your email or anywhere you wish
      // ask the user to contact you instead of leaving a bad review
    } else {
      //placeholder
    }
  },
);

//Home Page
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //int _counter = 0;
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: const Color(0x44aaaaff),
          title: Text(widget.title, style: const TextStyle(fontFamily: 'comic', color: Colors.blue,fontWeight: FontWeight.bold)),
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.blue),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25)),
          ),
          bottom: TabBar(
            indicatorColor: Colors.amber[800],
            labelColor: Colors.amber[800],
            unselectedLabelColor: Colors.blue,
            tabs: const <Widget> [
              Tooltip(message: 'Home', child: Tab(icon: Icon(Icons.home)),),
              Tooltip(message: 'English', child: Tab(icon: Text('Eng', style: TextStyle(fontWeight: FontWeight.bold))),),
              Tooltip(message: 'Hindi', child: Tab(icon: Text('Hin', style: TextStyle(fontWeight: FontWeight.bold))),),
              Tooltip(message: 'Gujarati', child: Tab(icon: Text('Guj', style: TextStyle(fontWeight: FontWeight.bold))),),
              Tooltip(message: 'Categories', child: Tab(icon: Icon(Icons.category)),),
            ],
          ),

          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: 'Open Drawer',
              );
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                showSearch(
                    context: context,
                    delegate: DataSearch(listWords)
                );
              },
              tooltip: 'Search',
            ),
          ],
        ),
        body: const TabBarView(
          children: [
            HomeScreen(),
            ProductsList(name: 'Book Name', author: 'Author', image: "assets/images/finallogo1.png" ,),
            ProductsList(name: 'Book Name', author: 'Author', image: "assets/images/finallogo1.png" ,),
            ProductsList(name: 'Book Name', author: 'Author', image: "assets/images/finallogo1.png" ,),
            ProductsList(name: 'Book Name', author: 'Author', image: "assets/images/finallogo1.png" ,),
          ],
        ),
        drawer: Drawer(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/BG10.jpg"),
                  fit: BoxFit.cover),
            ),
            child: ListView(
              padding: const EdgeInsets.all(0),
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Color(0x44aaaaff),
                  ),
                  child: UserAccountsDrawerHeader(
                    decoration: BoxDecoration(color: Color(0x00ffffff)),
                    accountName: Text(
                      "Hank Stark",
                      style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    accountEmail: Text("hankstark1204@gmail.com", style:TextStyle(fontSize: 14, color: Colors.yellow, fontWeight: FontWeight.bold)),
                    currentAccountPictureSize: Size.square(45),
                    currentAccountPicture: CircleAvatar(
                      backgroundColor: Colors.yellow,
                      child: Text(
                        "HS",
                        style: TextStyle(fontSize: 25.0, color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.person, color: Colors.blue),
                  title: const Text(' My Profile ',style: TextStyle(fontSize: 18, color: Colors.blue, fontWeight: FontWeight.bold)),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/profile');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.menu_book, color: Colors.blue),
                  title: const Text(' My Library ',style: TextStyle(fontSize: 18, color: Colors.blue, fontWeight: FontWeight.bold)),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/owned');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.logout, color: Colors.blue),
                  title: const Text(' Log Out ',style: TextStyle(fontSize: 18, color: Colors.blue, fontWeight: FontWeight.bold)),
                  onTap: () {
                    Navigator.pushReplacementNamed(context,'/login');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.star, color: Colors.blue),
                  title: const Text(' Rate Us ',style: TextStyle(fontSize: 18, color: Colors.blue, fontWeight: FontWeight.bold)),
                  onTap: () {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) => _dialog,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.amber[800],
          backgroundColor: const Color(0x44aaaaff),
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.blue,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.library_books),
              label: 'PYQs',
            ),
          ],
          currentIndex: _selectedIndex, //New
          onTap: _onItemTapped,
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
          },
          tooltip: 'FAQs',
          backgroundColor: const Color(0x44aaaaff),
          foregroundColor: Colors.blue,
          child: const Icon(Icons.help_rounded),
        ),
      ),
    );
  }
}

//Profile Page
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color(0x44aaaaff),
        title: const Text('My Profile', style: TextStyle(fontFamily: 'comic', color: Colors.blue,fontWeight: FontWeight.bold)),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.blue),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back_rounded),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
              tooltip: 'Go Back',
            );
          },
        ),
      ),
      body: Container(
          height: 200,
          width: double.infinity,
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
                image: AssetImage("assets/images/BG1Cropped.jpg"),
                fit: BoxFit.cover),
          ),
          child: SafeArea(
            child: Column(

              children: [
                SizedBox(
                  width: double.infinity,
                  height: 150,
                  child: Container(
                    alignment: const Alignment(0.0,2.5),
                    child: const CircleAvatar(
                      backgroundColor: Colors.yellow,
                      //backgroundImage: NetworkImage(
                      //"Add you profile DP image URL here "
                      //),
                      radius: 60.0,
                      child: Text(
                        "HS",
                        style: TextStyle(fontSize: 40.0, color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Hank Stark",
                  style: TextStyle(
                      fontSize: 25.0,
                      color:Colors.blue,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Ahmedabad, India"
                  ,style: TextStyle(
                    fontSize: 18.0,
                    color:Color(0xFFFF8F00),
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.bold
                ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Gender : Male"
                  ,style: TextStyle(
                    fontSize: 15.0,
                    color:Colors.blue,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.bold
                ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Card(
                    margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 8.0),
                    color: Color(0x44aaaaff),
                    elevation: 2.0,
                    child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 12,horizontal: 30),
                        child: Text("Level : 1",style: TextStyle(
                            color:Color(0xFFFF8F00),
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.bold
                        ),)
                    )
                ),
                const SizedBox(
                  height: 3,
                ),
                const Text(
                  "Member Since : 2022"
                  ,style: TextStyle(
                    fontSize: 14.0,
                    color:Colors.blue,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.bold
                ),
                ),
                Card(
                  margin: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 8.0),
                  color: const Color(0x44aaaaff),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Column(
                            children: const [
                              Text("Age",
                                style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold
                                ),),
                              SizedBox(
                                height: 3,
                              ),
                              Text("19",
                                style: TextStyle(
                                    color: Color(0xFFFF8F00),
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold
                                ),)
                            ],
                          ),
                        ),
                        Expanded(
                          child:
                          Column(
                            children: const [
                              Text("Email ID",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold
                                ),),
                              SizedBox(
                                height: 3,
                              ),
                              Text("hankstark1204\n  @gmail.com",
                                style: TextStyle(
                                    fontFamily: 'comic',
                                    color: Color(0xFFFF8F00),
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold
                                ),)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(const Color(0x44aaaaff)),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(80.0),
                                  side: const BorderSide(color: Color(0xFFFF8F00))
                              )
                          )
                      ),
                      child: const Text('Sign Out', style: TextStyle(fontFamily: 'comic', color: Color(0xFFFF8F00),fontWeight: FontWeight.bold)),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(const Color(0x44aaaaff)),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(80.0),
                                  side: const BorderSide(color: Color(0xFFFF8F00))
                              )
                          )
                      ),
                      child: const Text('Edit Profile', style: TextStyle(fontFamily: 'comic', color: Color(0xFFFF8F00),fontWeight: FontWeight.bold)),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                    ),
                  ],
                )
              ],
            ),
          )
      ),
    );
  }
}

//Product Browsing Page
class ProductsList extends StatelessWidget {
  final String name;
  final String author;
  //final int originalPrice;
  //final int discount;
  final String image;

  const ProductsList({super.key,
    required this.name,
    required this.author,
    //required this.originalPrice,
    //required this.discount,
    required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        color: Colors.black,
        image: DecorationImage(
            image: AssetImage("assets/images/BG1Cropped.jpg"),
            fit: BoxFit.cover
        ),
      ),
      child: SingleChildScrollView(
      child:Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
      Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(child: _buildProductItemCard(context)),
        ],
      ),
      ],
      ),
      ),
    );
  }

  _buildProductItemCard(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushReplacementNamed('/pdf');
        },
        child: Card(
          color:const Color(0x44aaaaff),
          elevation: 4.0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 200.0,
                width: 450.0,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      color: const Color(0x44aaaaff),
                      image: DecorationImage(
                          image: AssetImage(image),
                          fit: BoxFit.cover)
                  ),
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                ),
                child: Ink(color: Colors.transparent, child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      name,
                      style: const TextStyle(fontSize: 16.0, color: Colors.blue),
                    ),
                    const SizedBox(
                      height: 2.0,
                    ),
                    Ink(color: Colors.transparent, child:Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          author,
                          style: const TextStyle(fontSize: 16.0, color: Color(0xFFFF8F00)),
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        //Text(
                        //"\$$originalPrice",
                        //style: const TextStyle(
                        //fontSize: 12.0,
                        //color: Colors.grey,
                        //decoration: TextDecoration.lineThrough,
                        //),
                        //),
                        const SizedBox(
                          width: 8.0,
                        ),
                        //Text(
                        //"$discount% off",
                        //style: const TextStyle(fontSize: 12.0, color: Colors.grey),
                        //),
                      ],
                    ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                  ],
                ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//Owned Library Screen
class OwnedPage extends StatelessWidget {
  const OwnedPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color(0x44aaaaff),
        title: const Text('My Library', style: TextStyle(fontFamily: 'comic', color: Colors.blue,fontWeight: FontWeight.bold)),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.blue),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back_rounded),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
              tooltip: 'Go Back',
            );
          },
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
      ),
      body: const ProductsList(name: 'The Time Machine', author: 'HG Wells', image: "assets/images/testpdfcover1.jpg" ,),
    );
  }
}

//PDFScreen
class MyPDFScreen extends StatefulWidget {
  const MyPDFScreen({Key? key}) : super(key: key);

  @override
  State<MyPDFScreen> createState() => PDFScreen();
}

class PDFScreen extends State<MyPDFScreen> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: const Color(0x44aaaaff),
          title: const Text('PDF Viewer', style: TextStyle(fontFamily: 'comic',
              color: Colors.blue,
              fontWeight: FontWeight.bold)),
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.blue),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25)),
          ),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.arrow_back_rounded),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/owned');
                },
                tooltip: 'Go Back',
              );
            },
          ),
        ),
        body: SfPdfViewer.asset('assets/docs/testpdf1.pdf'),
        key: _pdfViewerKey
    );
  }
}

//Product Details Page
class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color(0x44aaaaff),
        title: const Text('Product Details', style: TextStyle(fontFamily: 'comic',
            color: Colors.blue,
            fontWeight: FontWeight.bold)),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.blue),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back_rounded),
              onPressed: () {
                Navigator.pop(context);
              },
              tooltip: 'Go Back',
            );
          },
        ),
      ),
      body: Container(
          height: 200,
          width: double.infinity,
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
                image: AssetImage("assets/images/BG1Cropped.jpg"),
                fit: BoxFit.cover),
          ),
          child: SafeArea(
            child: Column(

              children: [
                SizedBox(
                  width: double.infinity,
                  height: 150,
                  child: Container(
                    alignment: const Alignment(0.0, 2.5),
                    child: const CircleAvatar(
                      backgroundColor: Colors.yellow,
                      backgroundImage: AssetImage(
                          "assets/images/testpdfcover.jpg"
                      ),
                      radius: 70.0,
                      //child: Text(
                      //"HS",
                      //style: TextStyle(fontSize: 40.0,
                      //color: Colors.blue,
                      //fontWeight: FontWeight.bold),
                      //),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "The Time Machine",
                  style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.blue,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "H.G. Wells"
                  , style: TextStyle(
                    fontSize: 18.0,
                    color: Color(0xFFFF8F00),
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.bold
                ),
                ),
                const SizedBox(
                  height: 10,
                ),
                //const Text(
                //"Gender : Male"
                //, style: TextStyle(
                //fontSize: 15.0,
                //color: Colors.blue,
                //letterSpacing: 2.0,
                //fontWeight: FontWeight.bold
                //),
                //),
                const SizedBox(
                  height: 10,
                ),
                const Card(
                    margin: EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 8.0),
                    color: Color(0x44aaaaff),
                    elevation: 2.0,
                    child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 12, horizontal: 30),
                        child: Text("Cost : 500 INR", style: TextStyle(
                            color: Color(0xFFFF8F00),
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.bold
                        ),)
                    )
                ),
                const SizedBox(
                  height: 3,
                ),
                //const Text(
                //"Member Since : 2022"
                //, style: TextStyle(
                // fontSize: 14.0,
                // color: Colors.blue,
                // letterSpacing: 2.0,
                // fontWeight: FontWeight.bold
                // ),
                //),
                Card(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 8.0),
                  color: const Color(0x44aaaaff),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Column(
                            children: const [
                              Text("Issue",
                                style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold
                                ),),
                              SizedBox(
                                height: 3,
                              ),
                              Text("For A Month",
                                style: TextStyle(
                                    color: Color(0xFFFF8F00),
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold
                                ),)
                            ],
                          ),
                        ),
                        Expanded(
                          child:
                          Column(
                            children: const [
                              Text("OR Buy",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold
                                ),),
                              SizedBox(
                                height: 3,
                              ),
                              Text("And Keep It Forever!",
                                style: TextStyle(
                                    fontFamily: 'comic',
                                    color: Color(0xFFFF8F00),
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold
                                ),)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0x44aaaaff)),
                          shape: MaterialStateProperty.all<
                              RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(80.0),
                                  side: const BorderSide(
                                      color: Color(0xFFFF8F00))
                              )
                          )
                      ),
                      child: const Text('Buy', style: TextStyle(
                          fontFamily: 'comic',
                          color: Color(0xFFFF8F00),
                          fontWeight: FontWeight.bold)),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/owned');
                      },
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0x44aaaaff)),
                          shape: MaterialStateProperty.all<
                              RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(80.0),
                                  side: const BorderSide(
                                      color: Color(0xFFFF8F00))
                              )
                          )
                      ),
                      child: const Text('Issue', style: TextStyle(
                          fontFamily: 'comic',
                          color: Color(0xFFFF8F00),
                          fontWeight: FontWeight.bold)),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/owned');
                      },
                    ),
                  ],
                )
              ],
            ),
          )
      ),
    );
  }
}

//LoadingScreen2
class LoadingScreen2 extends StatelessWidget {
  const LoadingScreen2({super.key});
  @override
  Widget build(BuildContext context) {
    Timer(
        const Duration(seconds: 3),
            () =>
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => const MyLoginScreen())
            )
    );
    return Container(
      height: 200,
      width: double.infinity,
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/intro.gif"),
        ),
      ),
    );
  }
}