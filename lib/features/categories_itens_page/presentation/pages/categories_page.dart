import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../homepage/presentation/bloc/main_theme_bloc.dart';

class CategoriesPage extends StatefulWidget {
  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          leading: IconButton(
            icon: Icon(Icons.chevron_left_rounded),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Star Wars',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SafeArea(
          child: BlocBuilder<MainThemeBloc, MainThemeState>(
              builder: (BuildContext context, MainThemeState state) {
            if (state is LoadedCategories) {
              return ListView.builder(
                itemCount: state.categoriesList.length,
                itemBuilder: (context, index) => Card(
                  color: Colors.black54,
                  margin: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  child: GestureDetector(
                    onTap: () {},
                    child: ListTile(
                      title: Text(
                        state.categoriesList[index].name,
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: Icon(
                        Icons.chevron_right,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              );
            } else
              return Container();
          }),
        ),
      );
}
