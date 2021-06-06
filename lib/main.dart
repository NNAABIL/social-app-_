import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/app_layout/app_cubit/app_cubit.dart';
import 'app_layout/layout_screen.dart';
import 'file:///C:/Users/Magic/AndroidStudioProjects/social/lib/helper/consts.dart';
import 'package:social/helper/app_themes.dart';

import 'auth/login/loginScreen.dart';
import 'helper/bloc_observer.dart';
import 'helper/cache_helper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();

  uId = CacheHelper.getData(key: 'uId');
  print('uid>>>>>>>>>>>>>$uId');

  Widget widget;

  if(uId != null){
    widget = LayoutScreen();
  }else{widget = LoginScreen();}
  runApp(MyApp(startWidget: widget,));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;
  MyApp({this.startWidget});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppCubit()..getUserData())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.light,
        home: startWidget,

      ),
    );
  }
}

