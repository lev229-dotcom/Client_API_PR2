import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_client/state/cubit/cubit/reg_cubit.dart';
import 'package:flutter_client/user.dart';

import 'approuter/router.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _Registration();
}

class _Registration extends State<Registration> {
  final GlobalKey<FormState> _key = GlobalKey();

  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _key,
          child: BlocConsumer<RegCubit, RegState>(
            listener: (context, state) {
              if (state is ErrorState) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.message)));
              }
              if (state is SuccessState) {
                Navigator.pushReplacementNamed(context, userpage);
              }
            },
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Spacer(),
                  const Text(
                    'Регистрация',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 26),
                  ),
                  const Spacer(),
                  TextFormField(
                    maxLength: 25,
                    controller: _loginController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Логин не должен быть пустым';
                      }
                      if (value.length < 5) {
                        return 'Логин должен быть не менее 5 символов';
                      }
                      if (value.contains(RegExp(r"[а-яА-Я]"))) {
                        return 'Только английские символы ';
                      }

                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: 'Логин',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  TextFormField(
                    maxLength: 30,
                    controller: _passwordController,
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Пароль не должен быть пустым';
                      }
                      if (value.length < 5) {
                        return 'Пароль должен быть не менее 5 символов';
                      }
                      if (value.contains(RegExp(r"[а-яА-Я0]"), 0)) {
                        return 'Только английские символы ';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: 'Пароль',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  TextFormField(
                    maxLength: 100,
                    controller: _emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Почта не должна быть пустой';
                      }

                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: 'Почта',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 35,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_key.currentState!.validate()) {
                          context.read<RegCubit>().signUp(User(
                              email: _emailController.text,
                              password: _passwordController.text,
                              userName: _loginController.text));
                        } else {}
                      },
                      child: const Text(
                        'Зарегистрироваться',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  const Spacer(flex: 3),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: ElevatedButton(
                      onPressed: () =>
                          Navigator.pushReplacementNamed(context, log),
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(15),
                      ),
                      child: const Icon(Icons.arrow_back, color: Colors.white),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
