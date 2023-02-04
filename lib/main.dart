import 'package:bloc_first/bloc/authbloc/authbloc_bloc.dart';
import 'package:bloc_first/pages/login.dart';
import 'package:bloc_first/repos/authrepo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
  // Authrepo authrepo = Authrepo();
  // authrepo.login("stephen@gmail.com", "Samuel@2");
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => AuthblocBloc(Authrepo()))],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const LoginUi(),
      ),
    );

    /* ;*/
  }
}
