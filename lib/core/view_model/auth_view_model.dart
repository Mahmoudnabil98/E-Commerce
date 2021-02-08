

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_shop/core/services/firestore_user.dart';
import 'package:flutter_shop/model/user_model.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_shop/view/home_view.dart';

class AuthViewModel extends GetxController{
  String email;
  String password;
  String name;
  Rx<User> _user = Rx<User>();
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FacebookLogin  _facebookLogin = FacebookLogin();

   String get users => _user.value?.email;

  @override
  void onInit() {
    super.onInit();
    _user.bindStream(_firebaseAuth.authStateChanges());
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  void facebookSignInMethod() async{
    
   final FacebookLoginResult _facebookLoginResult =  await _facebookLogin.logIn(['email']);

   final _accessToken = _facebookLoginResult.accessToken.token;

   if(_facebookLoginResult.status == FacebookLoginStatus.loggedIn){
     final _facebookCredential = FacebookAuthProvider.credential(_accessToken);

     await _firebaseAuth.signInWithCredential(_facebookCredential).then((user) async{
        saveUser(user);
        Get.offAll(HomeView());

     });

   }
  }
  //////////////////
  // Google Sign In
  void googleSignInMethod() async{
   final GoogleSignInAccount googleUser =  await _googleSignIn.signIn();

   print(googleUser);
   GoogleSignInAuthentication googleSignInAuthentication = await googleUser.authentication;

  final AuthCredential credential = GoogleAuthProvider.credential(
     idToken: googleSignInAuthentication.idToken,
     accessToken: googleSignInAuthentication.accessToken,

   );
   await _firebaseAuth.signInWithCredential(credential).then((user)async{
      saveUser(user);
      Get.offAll(HomeView());
   });
  }
  /////////////////////////////////////////////
  
  //sign In Firebase

  void signInWithEmailAndPassword() async{
    try{
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      Get.offAll(HomeView());

    }catch(e){
      print(e.message);
      Get.snackbar('Error Login accunt', e.message,
      colorText: Colors.black,
      snackPosition: SnackPosition.BOTTOM,
      );
    }

  }

  ///////////////////////////
 // Create accunt by Firebase
  void createAccuntWithEmailAndPassword() async{
    try{
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password ).then((user) async{
      
      saveUser(user);
       });
      Get.offAll(HomeView());
     
      
    }catch(e){
      print(e.message);
      Get.snackbar('Error Login accunt', e.message,
      colorText: Colors.black,
      snackPosition: SnackPosition.BOTTOM,
      );
    }

  }



  void saveUser(UserCredential user)async{
     UserModel userModel = UserModel(
         userId: user.user.uid,
         email: user.user.email,
         name:  name ==null ?user.user.displayName :name,
         pic: ''

       );
       await FireStoreUser().addUserToFireStore(userModel);
  }

  
}