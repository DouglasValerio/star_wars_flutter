import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../injection_container.dart';

import '../bloc/main_theme_bloc.dart';
import '../widgets/list_main_themes.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => serviceLocator<MainThemeBloc>(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black87,
            title: Text(
              'Star Wars',
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: SafeArea(
              child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(30, 45, 30, 25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  color: Colors.black87,
                ),
                padding: EdgeInsets.all(30),
                child: Center(
                  child: Text(
                    'Main Themes',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                  height: MediaQuery.of(context).size.height - 230,
                  child: ListMainThemes()),
            ],
          )),
        ),
      );
}
