import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/src/presentation/blocs/bottom_navigation/bottom_nav_cubit.dart';
import 'package:to_do_list/src/presentation/blocs/task_list/task_list_cubit.dart';
import 'package:to_do_list/src/presentation/views/home_view.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<BottomNavCubit>(
            create: (BuildContext context) => BottomNavCubit(),
          ),
          BlocProvider<TaskListCubit>(
            create: (BuildContext context) => TaskListCubit(),
          ),
        ],
        child: Sizer(builder: (context, orientation, deviceType) {
          return MaterialApp(
            theme: ThemeData(primarySwatch: Colors.blue),
            home: HomeView(),
          );
        }));
  }
}
