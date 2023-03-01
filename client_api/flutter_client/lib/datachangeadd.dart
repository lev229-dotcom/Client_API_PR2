import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_client/approuter/router.dart';
import 'package:flutter_client/financialrecord.dart';
import 'package:flutter_client/state/cubit/cubit/data_cubit.dart';

class DataPage extends StatefulWidget {
  const DataPage({Key? key}) : super(key: key);

  @override
  State<DataPage> createState() => _DataPage();
}

class _DataPage extends State<DataPage> {
  final GlobalKey<FormState> _key = GlobalKey();

  final TextEditingController _name = TextEditingController();
  final TextEditingController _category = TextEditingController();
  final TextEditingController _desc = TextEditingController();
  final TextEditingController _sum = TextEditingController();
  final TextEditingController _id = TextEditingController();
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
                }
              },
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Spacer(),
                    const Text(
                      'Добавить/изменить запись',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 26),
                    ),
                    const Spacer(),
                    TextField(
                      decoration:
                          const InputDecoration(labelText: "Введите id"),
                      keyboardType: TextInputType.number,
                      controller: _id,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    TextFormField(
                      maxLength: 25,
                      controller: _name,
                      decoration: const InputDecoration(
                        hintText: 'Имя',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    TextFormField(
                      maxLength: 100,
                      controller: _category,
                      decoration: const InputDecoration(
                        hintText: 'Категория',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    TextFormField(
                      maxLength: 100,
                      controller: _desc,
                      decoration: const InputDecoration(
                        hintText: 'Описание',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    TextField(
                      decoration:
                          const InputDecoration(labelText: "Введите сумму"),
                      keyboardType: TextInputType.number,
                      controller: _sum,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    SizedBox(
                      height: 35,
                      child: ElevatedButton(
                        onPressed: () {
                          context.read<DataCubit>().updateRecord(
                              FinancialRecord(
                                  id: int.parse(_id.text),
                                  category: _category.text,
                                  date: DateTime.now(),
                                  description: _desc.text,
                                  status: true,
                                  operationName: _name.text,
                                  sum: double.parse(_sum.text)));
                          Navigator.pushNamed(context, userpage);
                        },
                        child: const Text(
                          'Изменить данные',
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
                          if (_key.currentState!.validate()) {
                            context.read<DataCubit>().addRecord(FinancialRecord(
                                category: _category.text,
                                date: DateTime.now(),
                                description: _desc.text,
                                status: true,
                                operationName: _name.text,
                                sum: double.parse(_sum.text)));
                            Navigator.pushNamed(context, userpage);
                          } else {}
                        },
                        child: const Text(
                          'Добавить данные',
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
