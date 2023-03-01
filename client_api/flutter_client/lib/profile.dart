import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_client/state/cubit/cubit/data_cubit.dart';
import 'package:flutter_client/user.dart';

import 'approuter/router.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({Key? key}) : super(key: key);

  @override
  State<UpdateProfile> createState() => _UpdateProfile();
}

class _UpdateProfile extends State<UpdateProfile> {
  final GlobalKey<FormState> _key = GlobalKey();
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _oldpasswordController = TextEditingController();
  final TextEditingController _newpasswordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _key,
            child: BlocConsumer<DataCubit, DataState>(
              listener: (context, state) {
                if (state is ErrorState) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(state.message)));
                } else if (state is SuccessState) {
                  Navigator.pushNamed(context, userpage);
                } else {}
              },
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Spacer(),
                    const Text(
                      'Изменение данных',
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
                        if (value.contains(RegExp(r"[а-яА-Я]"), 0)) {
                          return 'Только английские символы ';
                        }

                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Логин',
                        border: OutlineInputBorder(),
                      ),
                    ),

                    //Почта
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
                            context.read<DataCubit>().updateProfile(User(
                                userName: _loginController.text,
                                password: _oldpasswordController.text,
                                email: _emailController.text));
                            Navigator.pushNamed(context, userpage);
                          } else {}
                        },
                        child: const Text(
                          'Изменить данные',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    TextFormField(
                      maxLength: 30,
                      controller: _oldpasswordController,
                      decoration: const InputDecoration(
                        hintText: 'Старый Пароль',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    TextFormField(
                      maxLength: 30,
                      controller: _newpasswordController,
                      decoration: const InputDecoration(
                        hintText: 'Новый Пароль',
                        border: OutlineInputBorder(),
                      ),
                    ),

                    SizedBox(
                      height: 35,
                      child: ElevatedButton(
                        onPressed: () {
                          context.read<DataCubit>().changePassword(
                              _oldpasswordController.text,
                              _newpasswordController.text);
                        },
                        child: const Text(
                          'Изменить пароль',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    const Spacer(flex: 3),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: ElevatedButton(
                        onPressed: () => Navigator.pushNamed(context, userpage),
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(15),
                        ),
                        child:
                            const Icon(Icons.arrow_back, color: Colors.white),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
