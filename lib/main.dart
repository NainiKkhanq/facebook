import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:thread/appScreens/Home.dart';
import 'package:thread/authPages/Login.dart';
import 'package:thread/firebase_options.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
     debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // We will use Stream Builder there which will check Auth Changes so if user is login it will keep it login
      // Or if user press logout so it will detect and perform further functions
      // The snapshot below in builder will hold the data of Authentication
      // And the return is User mean if user is login we will take action or not  
      home: StreamBuilder<User?>(stream:FirebaseAuth.instance.authStateChanges() , builder: (context, snapshot) {
        
          if(snapshot.hasData && snapshot.data !=null){
            return const Home();
          }
          else{
            return const Login();
          }


      },),
    );
  }
}
