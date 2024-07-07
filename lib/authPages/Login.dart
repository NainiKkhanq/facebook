import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:thread/appScreens/Home.dart';
import 'package:thread/authPages/signup.dart';
import 'package:thread/widgets/login_text_forms.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _HomeState();
}

class _HomeState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Center(
              child: Image.network(
                  width: 80,
                  "https://res.cloudinary.com/datit6fwc/image/upload/v1720206749/1688663318threads-logo-white_vfrn53.png"),
            ),
            TextFields(
              controllers: emailController,
              hintText: 'Enter Email',
            ),
            TextFields(
              controllers: passwordController,
              hintText: 'Enter Password',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text("Forget Password",
                      style: TextStyle(color: Colors.black)),
                ),
              ],
            ),

            // To Give perfect sizing to widgets use Sizedbox
            SizedBox(
                height: 42,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    login(emailController.text.toString().trim(), passwordController.text.toString().trim());
                  },
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black,),
                  child: const Text("Login",
                      style: TextStyle(color: Colors.white)),
                )),
            const Spacer(),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  const Text("Don't have an account?"),
                  TextButton(onPressed: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const signUp(),));
                  }, child: const Text("Signup",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),))
                ],)
          ],
        ),
      )),
    );
  }
  Future <void> login(String email, String password)async{

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Home(),));
      },);
    } catch (e) {

      print(e);
      return;
    }



  }
}
