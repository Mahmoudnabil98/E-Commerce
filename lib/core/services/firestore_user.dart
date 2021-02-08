import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_shop/model/user_model.dart';

class FireStoreUser {
 final CollectionReference _userCollectionRef = FirebaseFirestore.instance.collection('Users');
 
 


 Future<void> addUserToFireStore(UserModel userModel)async{
   return _userCollectionRef.doc(userModel.userId).set(userModel.toJson());

 }
 
 

}