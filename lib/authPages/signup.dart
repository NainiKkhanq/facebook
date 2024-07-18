import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:thread/appScreens/Home.dart';
import 'package:thread/authPages/Login.dart';
import 'package:thread/widgets/login_text_forms.dart';

class signUp extends StatefulWidget {
  const signUp({super.key});

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  bool  isLoading = false;

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final fullNameController = TextEditingController();
    final userNameController = TextEditingController();
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
              hintText: 'Email',
            ),
            TextFields(
              controllers: passwordController,
              hintText: 'Password',
            ),
            TextFields(
              controllers: fullNameController,
              hintText: 'Full Name',
            ),
            TextFields(
              controllers: userNameController,
              hintText: 'User Name',
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
           isLoading? SizedBox(
               height: 42,
               width: double.infinity,
               child: ElevatedButton(
                 onPressed: () {

                   registeration(
                       emailController.text.toString().trim(),
                       passwordController.text.toString().trim(),
                       userNameController.text.toString().trim(),
                       fullNameController.text.toString().trim()
                   );

                   emailController.clear();
                   passwordController.clear();
                   userNameController.clear();
                   fullNameController.clear();
                 },
                 style: ElevatedButton.styleFrom(
                   backgroundColor: Colors.black,
                 ),
                 child: const Text("Sign Up",
                     style: TextStyle(color: Colors.white)),
               )):const CircularProgressIndicator(),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account?"),
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Login(),
                          ));
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ))
              ],
            )
          ],
        ),
      )),
    );
  }

  Future<void> registeration(
      String email, String password, String userName, String FullName) async {
    try {
      // Creating User and saving data about that user in userCredential like UID etc.
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      // Then we create a variable and save the userID there
      String userID = userCredential.user!.uid.toString();
      // Now saving the user data in FirebaseFirestore
      FirebaseFirestore.instance.collection("Users").doc(userID).set({
        'FullName': FullName,
        'userName': userName,
        'password': password,
        "email": email,
        "bio":"Write Bio"
      }).whenComplete(
        () {
          setState(() {
            isLoading = true;
          });
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const Home(),
              ));
        },
      );
    } catch (e) {
      print(e.toString());
      return;
    }
  }
}
