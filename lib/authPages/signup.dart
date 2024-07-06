import 'package:flutter/material.dart';
import 'package:thread/widgets/login_text_forms.dart';

class signUp extends StatefulWidget {
  const signUp({super.key});

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
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
            SizedBox(
                height: 42,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black,),
                  child: const Text("Sign Up",
                      style: TextStyle(color: Colors.white)),
                )),
            const Spacer(),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  const Text("Already have an account?"),
                  TextButton(onPressed: (){}, child: const Text("Login",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),))
                ],)
          ],
        ),
      )),
    );
  }
}