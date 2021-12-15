import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/src/presentation/blocs/bottom_navigation/bottom_nav_cubit.dart';
import 'package:to_do_list/src/presentation/views/home_view.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BottomNavCubit>(
        create: (context) => BottomNavCubit(),
        child: Sizer(builder: (context, orientation, deviceType) {
          return MaterialApp(
            theme: ThemeData(primarySwatch: Colors.blue),
            home: HomeView(),
          );
        }));
  }
}
