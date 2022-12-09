import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  //var _emailCtrl = TextEditingController();
  //tring _email = '';
  int _state = 0;

  String _password = '';
  bool _obscureText = true;
  bool _buttonNull = true;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    return Scaffold(
      backgroundColor: const Color(0xfff8f8f8),
      body: Column(children: [
        const Expanded(
            flex: 1,
            child: Image(
              image: AssetImage('assets/images/logo.png'),
              //
              height: 70.0,
            )),
        Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
                color: Colors.white,
              ),
              child: Form(
                key: _formKey,
                child: ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  children: [
                    Text('Inicia sesión',
                        style: GoogleFonts.nunito(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0,
                        )),
                    const SizedBox(
                      height: 40.0,
                    ),
                    Text('Correo electrónico',
                        style: GoogleFonts.nunito(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0,
                        )),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      validator: (value) {
                        const pattern =
                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                        final regex = RegExp(pattern);

                        if (value!.trim().isEmpty) {
                          return '¡Ingrese un correo!';
                        } else if (!regex.hasMatch(value)) {
                          showSnackbar('Ingresa un correo valido');
                        }

                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(15.0),
                          prefixIcon: const Icon(
                            FeatherIcons.mail,
                            color: Colors.grey,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(100.0)),
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(100.0)),
                          hintText: "Ingrese su correo electrónico"),
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    Text('Contraseña',
                        style: GoogleFonts.nunito(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0,
                        )),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      onChanged: (val) => setState(() {
                        _buttonNull = false;
                        _password = val;
                      }),
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return '¡Ingrese una contraseña!';
                        }
                        return null;
                      },
                      obscureText: _obscureText,
                      cursorColor: const Color(0xFF3C4E5D),
                      decoration: InputDecoration(
                        hintText: 'Ingrese su contraseña',
                        prefixIcon:
                            _obscureText ? _lockIconClosed() : _lockIconOpen(),
                        suffixIcon: IconButton(
                          icon: _obscureText
                              ? _iconVisibilityOn()
                              : _iconVisibilityOff(),
                          onPressed: chagedStateIcon,
                        ),
                        contentPadding: const EdgeInsets.all(15.0),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(100.0)),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(100.0)),
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    TextButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all(const StadiumBorder()),
                          backgroundColor: MaterialStateProperty.all(
                            _buttonNull ? Colors.grey : const Color(0xffF9B233),
                          )),
                      onPressed: _buttonNull
                          ? null
                          : () {
                              setState(() {
                                if (_state == 0) {
                                  animateButton();
                                }
                              });
                            },
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: setUpButtonChild(),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "¿No tienes una cuenta?",
                          style: GoogleFonts.nunito(),
                        ),
                        const SizedBox(
                          width: 15.0,
                        ),
                        Text(
                          "Registrarse",
                          style: GoogleFonts.nunito(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ))
      ]),
    );
  }

  Widget setUpButtonChild() {
    if (_state == 0) {
      return Text(
        "Iniciar sesión",
        style: GoogleFonts.nunito(
          color: Colors.white,
          fontSize: 19.0,
        ),
      );
    } else if (_state == 1) {
      return const CircularProgressIndicator(
        strokeWidth: 2.0,
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      );
    } else {
      return Text(
        "Iniciar sesión",
        style: GoogleFonts.nunito(
          color: Colors.white,
          fontSize: 17.0,
        ),
      );
    }
  }

  void animateButton() {
    if (mounted) {
      setState(() {
        _state = 1;
      });
    }

    Timer(const Duration(milliseconds: 3300), () {
      if (mounted) {
        setState(() {
          _state = 2;
        });
      }
    });
    Timer(const Duration(milliseconds: 3300), () {
      if (mounted) {
        setState(() {
          _state = 0;
        });
      }
    });

    if (_formKey.currentState!.validate()) {
      //_login();
      Navigator.pushNamed(context, 'home');
    } else {
      showSnackbar('¡Todos los campos deben ser válidos!');
    }
  }

  void showSnackbar(String mensaje) {
    final snackbar = SnackBar(
      backgroundColor: Colors.red,
      content: Container(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Text(mensaje)),
      // ignore: prefer_const_constructors
      duration: Duration(milliseconds: 2500),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void chagedStateIcon() => setState(() => _obscureText = !_obscureText);

  Widget _iconVisibilityOn() =>
      const Icon(FeatherIcons.eye, color: Colors.grey);
  Widget _iconVisibilityOff() =>
      const Icon(FeatherIcons.eyeOff, color: Colors.grey);
  Widget _lockIconClosed() => const Icon(
        FeatherIcons.lock,
        color: Colors.grey,
      );
  Widget _lockIconOpen() => const Icon(
        FeatherIcons.unlock,
        color: Colors.grey,
      );
}
