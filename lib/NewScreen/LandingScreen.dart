import 'package:flutter/material.dart';
import 'package:whatsapp_clone/NewScreen/LoginPage.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Text("Welcome to Whatsapp",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 29,
                fontWeight:FontWeight.w600,
              ),),
              SizedBox(
                  height: MediaQuery.of(context).size.height/8,
              ),
              ClipOval(
                child: Opacity(
                  opacity: 0.8,
                  child: Image.asset(
                    "assets/strawhats.gif",
                    height: 340,
                    width: 340,
                    fit: BoxFit.cover, // Adjust the BoxFit property as needed
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height/7,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                    ),
                    children: [
                      TextSpan(
                        text: "Agree and Continue to accept the"
                      ),
                      TextSpan(
                          text: " Whatsapp Terms of Service and Privacy Policy",
                        style: TextStyle(
                          color: Colors.cyan,

                        ),
                      ),
                    ]),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: (){
                  Navigator.pushAndRemoveUntil(
                      context, MaterialPageRoute(builder: (builder)=>
                  LoginPage()),(route) =>false);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width -110,
                  height: 50,
                    child: Card(
                      margin: EdgeInsets.all(0),
                      elevation: 8,
                      color: Colors.blue,
                      child: Center(
                        child: Text(
                          "AGREE AND CONTINUE",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
