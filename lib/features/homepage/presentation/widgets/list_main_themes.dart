import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/main_theme_bloc.dart';

class ListMainThemes extends StatefulWidget {
  @override
  _ListMainThemesState createState() => _ListMainThemesState();
}

class _ListMainThemesState extends State<ListMainThemes> {
  _sinkState() {
    BlocProvider.of<MainThemeBloc>(context).add(GetMainThemes());
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
          if (state is LoadingMainThemeState || state is EmptyMainTheme) {
            return Container(child: Text('vazio'));
          } else if (state is LoadedStateMainTheme) {
            return ListView.builder(
              itemCount: state.mainThemeList.length,
              itemBuilder: (context, index) => Card(
                color: Colors.black54,
                margin: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
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
            );
          } else {
            return Container();
          }
        },
      );
}
