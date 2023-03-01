import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_client/locator_service.dart';
import 'package:flutter_client/state/cubit/cubit/auth_cubit.dart';
import 'package:flutter_client/user.dart';

import 'approuter/router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  AppRouter router = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: Colors.indigo,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.indigo,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(color: Colors.white),
            backgroundColor: Colors.indigo,
          ),
        ),
      ),
      themeMode: ThemeMode.dark,
      initialRoute: log,
      onGenerateRoute: router.generateRouter,
    );
  }
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
  final GlobalKey<FormState> _key = GlobalKey();

  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Form(
              key: _key,
              child: BlocConsumer<AuthCubit, AuthState>(
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
                        'Авторизация',
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
                          return null;
                        },
                        decoration: const InputDecoration(
                          hintText: 'Пароль',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 35,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_key.currentState!.validate()) {
                              context.read<AuthCubit>().signIn(User(
                                  email: "",
                                  password: _passwordController.text,
                                  userName: _loginController.text));
                            } else {}
                          },
                          child: const Text(
                            'Авторизация',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        height: 35,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, reg);
                          },
                          child: const Text(
                            'Регистрация',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                      const Spacer(flex: 3),
                    ],
                  );
                },
              ))),
    );
  }
}
