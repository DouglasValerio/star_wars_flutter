import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars_flutter/features/categories_itens_page/presentation/bloc/main_theme_item_bloc.dart';
import 'package:star_wars_flutter/features/categories_itens_page/presentation/pages/categories_page.dart';
import '../../../../injection_container.dart';
import '../bloc/main_theme_bloc.dart';

class ListMainThemes extends StatefulWidget {
  @override
  _ListMainThemesState createState() => _ListMainThemesState();
}

class _ListMainThemesState extends State<ListMainThemes> {
  MainThemeBloc mainBloc;
  _sinkState() {
    mainBloc = BlocProvider.of<MainThemeBloc>(context);
    mainBloc.add(GetMainThemes());
  }

  @override
  void initState() {
    _sinkState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<MainThemeBloc, MainThemeState>(
        builder: (BuildContext context, MainThemeState state) {
          if (state is LoadedStateMainTheme) {
            return ListView.builder(
              itemCount: state.mainThemeList.length,
              itemBuilder: (context, index) => Card(
                color: Colors.black54,
                margin: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                child: GestureDetector(
                  onTap: () {
                    BlocProvider.of<MainThemeBloc>(context).add(
                        GetCategoriesList(
                            url: state.mainThemeList[index].apiUrl));
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) =>
                              BlocProvider<MainThemeBloc>.value(
                                  value: mainBloc,
                                  child: CategoriesPage(
                                    title: state.mainThemeList[index].theme,
                                  ))),
                    );
                  },
                  child: ListTile(
                    title: Text(
                      state.mainThemeList[index].theme
                              .substring(0, 1)
                              .toUpperCase() +
                          state.mainThemeList[index].theme.substring(1),
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
                    _sinkState();
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
                      child: Text('Try again',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                )
              ],
            );
          } else {
            return Container(
                child: Center(
              child: CircularProgressIndicator(),
            ));
          }
        },
      );
}
