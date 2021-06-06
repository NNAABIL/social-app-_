
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/app_layout/app_cubit/app_cubit.dart';
import 'package:social/app_layout/app_cubit/app_states.dart';
import 'package:social/bottomNav_screens/newPost/NewPost_screen.dart';
import 'package:social/helper/componants.dart';
import 'package:social/helper/icon_broken.dart';

class LayoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppState>(
     listener: (context,state){
       if (state is NewPostState){
         navigateTo(context, NewPostScreen());
       }
     },
      builder: (context,state){
      var appCubit = AppCubit.get(context);
       return Scaffold(
         appBar: AppBar(
           title:Text(appCubit.titles[appCubit.currentIndex]) ,
           actions: [
             IconButton(icon: Icon(IconBroken.Notification), onPressed: (){}),
             IconButton(icon: Icon(IconBroken.Search), onPressed: (){}),
           ],
         ),
         body: appCubit.screens[appCubit.currentIndex],
         bottomNavigationBar: BottomNavigationBar(
           onTap: (index){
             appCubit.changeCurrentIndex(index);
           },
           currentIndex:appCubit.currentIndex,
           items: [
             BottomNavigationBarItem(icon: Icon(IconBroken.Home),label: 'Home'),
             BottomNavigationBarItem(icon: Icon(IconBroken.Chat),label:'Chats'),
             BottomNavigationBarItem(icon: Icon(IconBroken.Paper_Upload),label:'Post'),
             BottomNavigationBarItem(icon: Icon(IconBroken.Location),label: 'Users'),
             BottomNavigationBarItem(icon: Icon(IconBroken.Setting),label: 'Settings'),
           ],
         ),
       );
      },
    );
  }
}
