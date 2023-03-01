import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_client/datachangeadd.dart';
import 'package:flutter_client/locator_service.dart';
import 'package:flutter_client/mainpage.dart';
import 'package:flutter_client/profile.dart';
import 'package:flutter_client/state/cubit/cubit/auth_cubit.dart';
import 'package:flutter_client/state/cubit/cubit/data_cubit.dart';
import '../main.dart';
import '../registratin.dart';
import '../state/cubit/cubit/reg_cubit.dart';

const String log = 'log';
const String reg = 'reg';
const String userpage = 'userpage';
const String updateprofile = 'profile';
const String data = 'data';

class AppRouter {
  Route<dynamic>? generateRouter(RouteSettings settings) {
    switch (settings.name) {
      case log:
        {
          return MaterialPageRoute(
              builder: (_) => BlocProvider(
                    create: (context) => AuthCubit(sl()),
                    child: const Login(),
                  ));
        }
      case reg:
        {
          return MaterialPageRoute(
              builder: (_) => BlocProvider(
                    create: (context) => RegCubit(sl()),
                    child: const Registration(),
                  ));
        }
      case userpage:
        {
          return MaterialPageRoute(
              builder: (_) => BlocProvider(
                    create: (context) => DataCubit(sl()),
                    child: const MainDataPage(),
                  ));
        }
      case updateprofile:
        {
          return MaterialPageRoute(
              builder: (_) => BlocProvider(
                    create: (context) => DataCubit(sl()),
                    child: const UpdateProfile(),
                  ));
        }
      case data:
        {
          return MaterialPageRoute(
              builder: (_) => BlocProvider(
                    create: (context) => DataCubit(sl()),
                    child: const DataPage(),
                  ));
        }
      default:
        {
          return MaterialPageRoute(
              builder: (_) => BlocProvider(
                    create: (context) => AuthCubit(sl()),
                    child: const Login(),
                  ));
        }
    }
  }
}
