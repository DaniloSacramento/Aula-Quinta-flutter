import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class Cadastro extends StatefulWidget {
  Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final _formkey = GlobalKey<FormState>();
  final _senha = TextEditingController();
  final _email = TextEditingController();
  final _number = TextEditingController();
  bool _showSenha = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 368, top: 20),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back, color: Colors.red),
            ),
          ),
          Wrap(
            children: const [
              Padding(
                padding: EdgeInsets.only(top: 8, left: 20),
                child: Text(
                  'Cadastre-se e vire um mestre Pokemon',
                  style: TextStyle(fontFamily: 'Cute', fontSize: 50, color: Colors.red),
                ),
              ),
            ],
          ),
          Form(
            key: _formkey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(18),
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
                  padding: const EdgeInsets.all(16),
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
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextFormField(
                    controller: _number,
                    validator: Validatorless.multiple(
                      [
                        Validatorless.required('Digite seu numero de celular'),
                        Validatorless.number('Digite um numero de celular valido'),
                      ],
                    ),
                    decoration: InputDecoration(
                      hintText: "Numero de celular",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          15.0,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: 314,
            height: 40,
            child: ElevatedButton(
              onPressed: () {
                var formValid = _formkey.currentState?.validate() ?? false;
                if (formValid) {}
              },
              style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24))),
              child: const Text("Cadastrar"),
            ),
          ),
        ],
      ),
    ));
  }
}
