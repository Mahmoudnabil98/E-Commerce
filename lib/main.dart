import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/helper/binding.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import './view/control_view.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Binding(),

    debugShowCheckedModeBanner: false,
  
      theme: ThemeData(
        primaryColor: Color.fromRGBO(0, 197, 105, 1),
        fontFamily: 'SourceSansPro',

        
      ),
      home: ControlView(),

    );
  }
}
