import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social/app_layout/app_cubit/app_states.dart';
import 'package:social/bottomNav_screens/chats/chats_screen.dart';
import 'package:social/bottomNav_screens/feeds/feeds_screen.dart';
import 'package:social/bottomNav_screens/newPost/NewPost_screen.dart';
import 'package:social/bottomNav_screens/settings/settings_screen.dart';
import 'package:social/bottomNav_screens/users/users_screen.dart';
import 'package:social/helper/cache_helper.dart';
import 'package:social/helper/consts.dart';
import 'package:social/models/post_model.dart';
import 'package:social/models/user_model.dart';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screens = [
    FeedsScreen(),
    ChatsScreen(),
    NewPostScreen(),
    UsersScreen(),
    SettingsScreen()
  ];

  List<String> titles = [
    'Home',
    'Chats',
    'Post',
    'Users',
    'Settings',
  ];

  changeCurrentIndex(index) {
    if (index == 2) {
      emit(NewPostState());
    } else {
      currentIndex = index;
      emit(ChangeBottomNavState());
    }
  }

  UserModel userModel;

  getUserData() {
    emit(AppLoadingState());
    uId = CacheHelper.getData(key: 'uId');
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      print(value.data());
      userModel = UserModel.fromJson(value.data());
      emit(AppGetUserSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(AppGetUserErrorState(error: error.toString()));
    });
  }

  File profileImage;
  final picker = ImagePicker();

  Future getProfileImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      emit(PickProfileSuccessState());
    } else {
      print('No image selected.');
      emit(PickProfileErrorState());
    }
  }

  uploadProfile({
    @required String name,
    @required String phone,
    @required String bio,
  }) {
    emit(UpdateUserLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(profileImage.path).pathSegments.length}')
        .putFile(profileImage)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        updateUser(
          name: name,
          phone: phone,
          bio: bio,
          image: value,
        );
        // emit(UploadProfileSuccessState());
      }).catchError((error) {
        emit(UploadProfileErrorState());
      });
    }).catchError((error) {
      emit(UploadProfileErrorState());
    });
  }

  File coverImage;

  Future getCoverImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      coverImage = File(pickedFile.path);
      emit(PickCoverSuccessState());
    } else {
      print('No image selected.');
      emit(PickCoverErrorState());
    }
  }

  uploadCover({
    @required String name,
    @required String phone,
    @required String bio,
  }) {
    emit(UpdateUserLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(coverImage.path).pathSegments.length}')
        .putFile(coverImage)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        updateUser(name: name, phone: phone, bio: bio, cover: value);
        // emit(UploadCoverSuccessState());
      }).catchError((error) {
        emit(UploadCoverErrorState());
      });
    }).catchError((error) {
      emit(UploadCoverErrorState());
    });
  }

  updateUser(
      {@required String name,
      @required String phone,
      @required String bio,
      String image,
      String cover}) {
    emit(UpdateUserLoadingState());
    uId = CacheHelper.getData(key: 'uId');
    UserModel model = UserModel(
        name: name,
        phone: phone,
        bio: bio,
        image: image ?? userModel.image,
        cover: cover ?? userModel.cover,
        email: userModel.email,
        uId: userModel.uId);
    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel.uId)
        .update(model.toJson())
        .then((value) {
      getUserData();
    }).catchError((error) {
      print(error.toString());
      emit(UpdateUserErrorState());
    });
  }

  File postImage;

  Future getPostImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      postImage = File(pickedFile.path);
      emit(PickPostImageSuccessState());
    } else {
      print('No image selected.');
      emit(PickPostImageErrorState());
    }
  }

  uploadPostImage({@required String text, String dateTime}) {
    emit(CreatePostLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('posts/${Uri.file(postImage.path).pathSegments.last}')
        .putFile(profileImage)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        createNewPost(text: text, dateTime: dateTime, postImage: value);
      });
    }).catchError((error) {
      emit(CreatePostErrorState());
    });
  }

  createNewPost({
    @required String text,
    String dateTime,
    String postImage,
  }) {
    emit(CreatePostLoadingState());

    PostModel postModel = PostModel(
        uId: userModel.uId,
        name: userModel.name,
        text: text,
        image: userModel.image,
        dateTime: dateTime,
        postImage: postImage ?? '');
    FirebaseFirestore.instance
        .collection('posts')
        .add(postModel.toJson())
        .then((value) {
      emit(CreatePostSuccessState());
    }).catchError((error) {
      emit(CreatePostErrorState());
    });
  }

  removePostImage(){
    postImage = null;
    emit(RemovePostImage());
  }

}
