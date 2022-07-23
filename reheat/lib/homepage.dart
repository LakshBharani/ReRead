import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reheat/authentication_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Home'),
          RaisedButton(
            onPressed: () {
              context.read<AuthenticationService>().signOut();
            },
            child: Text('Sign out'),
          )
        ],
      ),
    );
  }
}
