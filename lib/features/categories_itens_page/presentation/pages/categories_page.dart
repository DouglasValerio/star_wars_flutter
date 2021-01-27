import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../homepage/presentation/bloc/main_theme_bloc.dart';

class CategoriesPage extends StatefulWidget {
  final String title;

  const CategoriesPage({Key key, this.title}) : super(key: key);
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
              BlocProvider.of<MainThemeBloc>(context).add(GetMainThemes());
            },
          ),
          title: Text(
            widget.title == null
                ? 'Categories'
                : widget.title.substring(0, 1).toUpperCase() +
                    widget.title.substring(1),
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: WillPopScope(
          onWillPop: () async {
            BlocProvider.of<MainThemeBloc>(context).add(GetMainThemes());
            return Future.value(true);
          },
          child: SafeArea(
            minimum: EdgeInsets.symmetric(vertical: 15),
            child: BlocBuilder<MainThemeBloc, MainThemeState>(
                builder: (BuildContext context, MainThemeState state) {
              if (state is LoadedCategories) {
                return ListView.builder(
                  itemCount: state.categoriesList.length,
                  itemBuilder: (context, index) => Card(
                    color: Colors.lightBlue[900],
                    margin: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.transparent,
                          builder: (BuildContext context) => Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20))),
                            height: MediaQuery.of(context).size.height * 0.8,
                            child: Padding(
                              padding: EdgeInsets.all(30),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(
                                    Icons.warning,
                                    color: Colors.deepOrange,
                                    size: 32,
                                  ),
                                  Text(
                                      'Oops, looks like this \nfeature is not available',
                                      style: TextStyle(
                                          color: Colors.deepOrange,
                                          fontSize: 18),
                                      textAlign: TextAlign.center),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
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
              } else if (state is ErrorState) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.wifi_off,
                      color: Colors.red[600],
                      size: 90,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Looks like your internet connection is unstable\n Check your network status \nYou can also try again later',
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                        BlocProvider.of<MainThemeBloc>(context)
                            .add(GetMainThemes());
                      },
                      child: Container(
                        height: 48,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.blueGrey[700],
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        child: Center(
                          child: Text('Tentar novamante',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    )
                  ],
                );
              } else {
                return Container(
                  child: Center(child: CircularProgressIndicator()),
                );
              }
            }),
          ),
        ),
      );
}
