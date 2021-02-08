

import 'package:cloud_firestore/cloud_firestore.dart';

class HomeServices{

  final CollectionReference _categoryRefence = FirebaseFirestore.instance.collection('Catagories');
  final CollectionReference _productRefence = FirebaseFirestore.instance.collection('Products');




  Future<List<QueryDocumentSnapshot>> getCategory() async {
    var value =  await _categoryRefence.get();
    return value.docs;
  }
   Future<List<QueryDocumentSnapshot>> getBestSelling() async {
    var value =  await _productRefence.get();
    return value.docs;
  }
 }