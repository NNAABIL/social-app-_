import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/auth/register/register_cubit/register_states.dart';
import 'package:social/models/user_model.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  IconData suffix = Icons.visibility;
  bool isPassword = true;

  changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility : Icons.visibility_off;
    emit(ChangeRegisterPasswordVisibility());
  }

  userRegister(
      {@required String email,
      @required String password,
      @required String phone,
      @required String name}) {

    emit(RegisterLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print('userID======>${value.user.uid}');
      print('userEmail======>${value.user.email}');
      createUser(
        uId: value.user.uid,
        phone: phone,
        name: name,
        email: email,
      );
    }).catchError((error) {
      print(error.toString());
      emit(RegisterErrorState(error.toString()));
    });
  }

  createUser({
    @required String email,
    @required String name,
    @required String phone,
    @required String uId,
  }) {
    UserModel model = UserModel(
      email: email,
      name: name,
      phone: phone,
      uId: uId,
      bio: 'write your bio ..',

      cover: 'https://image.freepik.com/free-photo/photo-charming-cute-young-african-american-girl-smiles-pleasantly-camera-keeps-both-hands-chin-shows-white-teeth-dressed-black-clothing_273609-33976.jpg',
      image: 'https://image.freepik.com/free-photo/photo-charming-cute-young-african-american-girl-smiles-pleasantly-camera-keeps-both-hands-chin-shows-white-teeth-dressed-black-clothing_273609-33976.jpg'
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toJson())
        .then((value) {
      emit(CreateUserSuccessState());
    }).catchError((error) {
      emit(CreateUserErrorState(error.toString()));
    });
  }
}
