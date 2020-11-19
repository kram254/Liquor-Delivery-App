import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lika/utils/screen_navigation.dart';
import 'package:lika/view/auth/user.dart';
import 'package:lika/view/auth/Registration.dart';
import 'package:lika/view/product/home.dart';
import 'package:lika/components/loading.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      key: _key,
      backgroundColor: Colors.white,
      body: authProvider.status == Status.Authenticating? Loading() : SingleChildScrollView(
        child:Column(
          children: [
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo/logo.png',
                  width: 50,
                  height: 70,
                ),
              ],
            ),

            SizedBox(height: 15,),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[400]),
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: TextFormField(
                    controller: authProvider.email,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Email",
                      icon: Icon(Icons.email)
                    )
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[400]),
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: TextFormField(
                    controller: authProvider.password,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Password",
                      icon: Icon(Icons.lock)
                    )
                  ),
                ),
              ),
            ),

            SizedBox(height: 15,),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: GestureDetector(
                  onTap: () async{ 
                    if(!await authProvider.signIn()){
                     _key.currentState.showSnackBar(
                       SnackBar(content: Text("Login failed")),
                     );
                     return; ///cuts the execution of this page
                    }
                     authProvider.cleanControllers();
                     changeScreenReplacement(context, Home());

                  },
                  child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    border: Border.all(color: Colors.grey[400]),
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom:  10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Login", style: TextStyle(color: Colors.white, fontSize: 22),)
                      ],
                    )
                  ),
                ),
              ),
            ),

             GestureDetector(
               onTap: (){
                 changeScreen(context, RegistrationScreen());
               },
                child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                          Text("Register Here", style: TextStyle(color: Colors.blue, fontSize: 22),)
                        ],
                      ),
             ),
          ],
        )
      ),
    );
  }
}