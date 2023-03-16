import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:trab_quinta_flutter/consts/consts.dart';
import 'package:validatorless/validatorless.dart';
import 'cadastro_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _senha = TextEditingController();
  final _email = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  bool _showSenha = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10, top: 10, right: 65, left: 65),
          child: Opacity(
            opacity: 1,
            child: Image.asset(ConstsApp.pokeball)
                .animate(onPlay: ((controller) => controller.repeat()))
                .moveY(begin: -25, end: 15, curve: Curves.easeInOut, duration: 1000.ms)
                .then()
                .moveY(
                  begin: 15,
                  end: -25,
                  curve: Curves.easeInOut,
                ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Padding(
              padding: EdgeInsets.only(bottom: 0, top: 15),
              child: Text(
                'POKEDEX',
                style: TextStyle(fontSize: 42, fontFamily: 'Cute', color: Colors.red),
              ),
            )
          ],
        ),
        Form(
          key: _formkey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _email,
                    validator: Validatorless.multiple(
                      [
                        Validatorless.required('Digite seu email'),
                        Validatorless.email('Email inválido'),
                      ],
                    ),
                    decoration: InputDecoration(
                      hintText: "E-mail",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          15.0,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _senha,
                    validator: Validatorless.multiple(
                      [
                        Validatorless.required('Digite sua senha'),
                        Validatorless.min(6, 'Senha invalida'),
                      ],
                    ),
                    decoration: InputDecoration(
                      hintText: "Senha",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          15.0,
                        ),
                      ),
                      suffixIcon: GestureDetector(
                        child: Icon(_showSenha == false ? Icons.visibility_off : Icons.visibility),
                        onTap: () {
                          setState(() {
                            _showSenha = !_showSenha;
                          });
                        },
                      ),
                    ),
                    obscureText: _showSenha == false ? true : false,
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 314,
            height: 40,
            child: ElevatedButton(
              onPressed: () {
                var formValid = _formkey.currentState?.validate() ?? false;
                if (formValid) {}
              },
              style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24))),
              child: const Text(
                'Entrar',
                style: TextStyle(fontFamily: 'Cute', fontSize: 35),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 314,
          height: 40,
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Cadastro(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)), backgroundColor: Colors.white),
            child: const Text(
              'Cadastre-se',
              style: TextStyle(fontFamily: 'Cute', fontSize: 35, color: Colors.red),
            ),
          ),
        )
      ],
    )));
  }
}
