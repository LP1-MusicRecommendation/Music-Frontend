import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:music_recommender/config/config.dart';
import 'package:music_recommender/screens/widgets/text_field_label.dart';
import 'package:music_recommender/screens/widgets/text_field_suffix_icon.dart';
import 'package:music_visualizer/music_visualizer.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';

class Authentication extends StatefulWidget {

  const Authentication({Key? key}) : super(key: key);

  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  late FlipCardController _controller;


  Widget backGroundContainer(var h, var w){
    return Container(
      color: primary,
      child: Column(
        children: [
          Container(
            height: h,
            width: w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
              color: secondary,
            ),
          )
        ],
      ),
    );
  }

  Widget buildAuthButton(String val){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
      decoration: BoxDecoration(
        color: secondary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(child: Text(val,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w400),)),
    );
  }

  Widget toggleText(String val){
    return Container(
        color: Colors.transparent,
        child: Center(
          child: Text(
            val,
            style: TextStyle(color: secondary,fontSize: 16,fontWeight: FontWeight.w300),
          ),
          ),
        );
  }

  Widget buildRegisterForm(var height,var width){
    return Center(
      child: Container(
        width: width*0.8,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: shadowList,
        ),
        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 12),
        child: Column(
          children: [
            SizedBox(height: height*0.03,),
            Text('Get Started!',
              style: TextStyle(
                color: secondary,
                fontSize: 24,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: height*0.03,),
            TextFieldLabel(prefixIcon: Icons.person, label: 'Username', hint: '', errorText: 'Duplicate Username', accent: primary, inputType: TextInputType.text, obscure: false, onSaved: (username){}),
            SizedBox(height: height*0.03,),
            TextFieldLabel(prefixIcon: Icons.email, label: 'Email', hint: '', errorText: 'Wrong Email', accent: primary, inputType: TextInputType.text, obscure: false, onSaved: (email){}),
            SizedBox(height: height*0.03,),
            TextFieldSuffixIcon(suffixIcon: Icons.visibility,prefixIcon: Icons.lock, label: 'Password', hint: '', errorText: 'Wrong Password', accent: primary, inputType: TextInputType.text, obscure: true, onSaved: (password){}),
            SizedBox(height: height*0.03,),
            GestureDetector(
              onTap: (){},
              child: buildAuthButton('Sign Up'),
            ),
            SizedBox(height: height*0.03,),
            GestureDetector(onTap:(){
              _controller.toggleCard();
            }, child: toggleText('Already have an account?'),),
            SizedBox(height: height*0.03,),
          ],
        ),
      ),
    );
  }

  Widget buildLoginForm(var height, var width){
    return Center(
      child: Container(
        width: width*0.8,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: shadowList,
        ),
        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 12),
        child: Column(
          children: [
            SizedBox(height: height*0.03,),
            Text('Welcome Back!',
              style: TextStyle(
                color: secondary,
                fontSize: 24,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: height*0.03,),
            TextFieldLabel(prefixIcon: Icons.email, label: 'Email', hint: '', errorText: 'Wrong Email', accent: primary, inputType: TextInputType.text, obscure: false, onSaved: (email){}),
            SizedBox(height: height*0.03,),
            TextFieldSuffixIcon(suffixIcon: Icons.visibility,prefixIcon: Icons.lock, label: 'Password', hint: '', errorText: 'Wrong Password', accent: primary, inputType: TextInputType.text, obscure: true, onSaved: (password){}),
            SizedBox(height: height*0.03,),
            GestureDetector(
              onTap: (){},
              child: buildAuthButton('Sign In'),
            ),
            SizedBox(height: height*0.03,),
            GestureDetector( onTap:(){
              _controller.toggleCard();
            },child: toggleText("Don't have an account?"),),
            SizedBox(height: height*0.03,),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = FlipCardController();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final List<int> duration = [900, 700, 600, 800, 500];
    final List<Color> colors = [
      Colors.white,
      secondary,
      Colors.white,
      secondary,
    ];



    return  Material(
      child: SafeArea(
        child: Stack(
          children: [
            backGroundContainer(height*0.3,width),
            Column(
              children: [
                SizedBox(height: height*0.1,),
                Text(
                  'Music Recommender',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 32
                  ),
                ),
                SizedBox(height: height*0.03,),
                FlipCard(
                    flipOnTouch: false,
                    controller: _controller,
                    front: buildLoginForm(height, width),
                    back: buildRegisterForm(height, width)
                ),
                // buildRegisterForm(height, width),
                SizedBox(height: height*0.09,),
                Container(
                  width: width*0.8,
                  child: MusicVisualizer(
                    barCount: 30,
                    colors: colors,
                    duration: duration,
                  ),
                )
              ],
            )
          ]
        ),
      ),
    );
  }
}
