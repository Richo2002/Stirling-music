import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc.navigation_bloc/navigation_bloc.dart';
import 'sidebar.dart';
import '../pages/home_page.dart';

class SideBarLayout extends StatefulWidget {
  const SideBarLayout({ Key? key }) : super(key: key);

  @override
  State<SideBarLayout> createState() => _SideBarLayoutState();
}

class _SideBarLayoutState extends State<SideBarLayout> {
  NavigationStates get initialState => HomePage();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<NavigationBloc>(
        create: (context) => NavigationBloc(initialState),
        child: Stack(
          children: <Widget>[
            BlocBuilder<NavigationBloc, NavigationStates>(
              builder: (context, navigationState) {
                return navigationState as Widget;
              },
            ),
            SideBar(),
          ],
        ),
      ),
    );
  }
}
