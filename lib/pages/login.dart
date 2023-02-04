import 'package:bloc_first/bloc/authbloc/authbloc_bloc.dart';
import 'package:bloc_first/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginUi extends StatefulWidget {
  const LoginUi({super.key});

  @override
  State<LoginUi> createState() => _LoginUiState();
}

class _LoginUiState extends State<LoginUi> {
  final email = TextEditingController();
  final password = TextEditingController();
  late AuthblocBloc _authblocBloc;
  @override
  void initState() {
    super.initState();
    _authblocBloc = BlocProvider.of<AuthblocBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          child: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextFormField(
              controller: email,
              decoration: const InputDecoration(
                  icon: Icon(Icons.email), label: Text('Email'))),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextFormField(
              obscureText: true,
              controller: password,
              decoration: const InputDecoration(
                  icon: Icon(Icons.email), label: Text('Email'))),
        ),
        BlocListener<AuthblocBloc, AuthblocState>(
          listener: (context, state) {
            if (state is AuthLoading) {
              const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is AuthSuccess) {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const HomePage(),
              ));
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Successfully logged in as")));
            } else if (state is Autherror) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Wrong email password combination")));
            }
          },
          child: ElevatedButton(
              onPressed: () {
                _authblocBloc.add(
                    LoginEvent(email: email.text, password: password.text));
              },
              child: const Center(child: Text("Login"))),
        )
      ])),
    );
  }
}
