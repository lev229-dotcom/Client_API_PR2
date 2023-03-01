import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_client/financialrecord.dart';
import 'package:flutter_client/getmodel.dart';
import 'package:flutter_client/state/cubit/cubit/data_cubit.dart';

import 'approuter/router.dart';

class MainDataPage extends StatefulWidget {
  const MainDataPage({Key? key}) : super(key: key);

  @override
  State<MainDataPage> createState() => _MainDataPage();
}

GetModel model = GetModel(5, 0, "", true, "name");

class _MainDataPage extends State<MainDataPage> {
  GlobalKey<FormState> _key = GlobalKey();

  TextEditingController _loginController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController numController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  late Future<List<FinancialRecord>> notesList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: BlocBuilder<DataCubit, DataState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Form(
              key: _key,
              child: Column(
                children: [
                  TextField(
                    decoration: const InputDecoration(
                        labelText: "Введите id для удаления записи"),
                    keyboardType: TextInputType.number,
                    controller: numController,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 35,
                    child: ElevatedButton(
                      onPressed: () {
                        if (numController.text == "") {
                          return;
                        }
                        context
                            .read<DataCubit>()
                            .deleteData(1, int.parse(numController.text));
                      },
                      child: const Text(
                        'Удалить (логическое)',
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
                        if (numController.text == "") {
                          return;
                        }
                        context
                            .read<DataCubit>()
                            .deleteData(0, int.parse(numController.text));
                      },
                      child: const Text(
                        'Удалить (физическое)',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  TextField(
                    decoration: const InputDecoration(
                        labelText: "Введите параметр для поиска/фильтрации"),
                    keyboardType: TextInputType.text,
                    controller: searchController,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.singleLineFormatter
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 35,
                    child: ElevatedButton(
                      onPressed: () {
                        model.option = searchController.text;
                        model.type = "id";
                      },
                      child: const Text(
                        'Поиск по id',
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
                        model.option = searchController.text;
                        model.type = "name";
                      },
                      child: const Text(
                        'Поиск по имени',
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
                        model.option = searchController.text;
                        model.type = "category";
                      },
                      child: const Text(
                        'Поиск по категории',
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
                        Navigator.pushReplacementNamed(context, log);
                      },
                      child: const Text(
                        'Логин',
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
                        Navigator.pushReplacementNamed(context, updateprofile);
                      },
                      child: const Text(
                        'Изменить данные профиля',
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
                        Navigator.pushReplacementNamed(context, data);
                      },
                      child: const Text(
                        'Работа с данными',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  FutureBuilder(
                      future: context.read<DataCubit>().getData(model),
                      builder: (context, snapshot) {
                        List<Widget> childrenVal = <Widget>[];
                        if (snapshot.hasData) {
                          childrenVal = <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                for (int i = 0; i < snapshot.data!.length; i++)
                                  Column(
                                    children: [
                                      Text(
                                          "id: ${snapshot.data?.elementAt(i).id}",
                                          style: const TextStyle(fontSize: 18)),
                                      Text(
                                          "Имя: ${snapshot.data?.elementAt(i).operationName}",
                                          style: const TextStyle(fontSize: 18)),
                                      Text(
                                          "Категория: ${snapshot.data?.elementAt(i).category}",
                                          style: const TextStyle(fontSize: 18)),
                                      Text(
                                          "Дата создания: ${DateTime.tryParse(snapshot.data!.elementAt(i).date.toString())!.toLocal()}",
                                          style: const TextStyle(fontSize: 18)),
                                      Text(
                                          "Статус: ${snapshot.data?.elementAt(i).description}",
                                          style: const TextStyle(fontSize: 18)),
                                      Text(
                                          "Сумма: ${snapshot.data?.elementAt(i).sum}",
                                          style: const TextStyle(fontSize: 18)),
                                    ],
                                  )
                              ],
                            ),
                          ];
                        }
                        return Center(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: childrenVal,
                        ));
                      }),
                ],
              ),
            ),
          );
        },
      )),
    );
  }
}
