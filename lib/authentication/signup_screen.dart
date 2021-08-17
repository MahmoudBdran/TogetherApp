import 'dart:io';
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexagon/hexagon.dart';
import 'package:image_picker/image_picker.dart';
import 'package:together/HomePagePackage/home_page.dart';
import 'package:together/authentication/signup_screen.dart';
import 'package:together/constatPackage/constants.dart';
import 'package:together/firebasePackage/auth.dart';

class SignUpScreen extends StatefulWidget {

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool hidePassword = true;
  bool hideConfirmPassword = true;
  bool _rememberMe = false;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var usernameController= TextEditingController();
  var phoneController= TextEditingController();
  var workController= TextEditingController();
  var workAtController= TextEditingController();
  var livesInController= TextEditingController();
  var fromController= TextEditingController();
  var studyController= TextEditingController();
  var studyAtController= TextEditingController();
  var confirmPasswordController=TextEditingController();
   late String downloadUrl;
   late File _profileImage;
  final profileImagePicker= ImagePicker();
  Future pickImageForprofileImage() async {
    final pickedFile = await profileImagePicker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _profileImage = File(pickedFile.path);
        print("path is : "+_profileImage.path);
      } else {
        print('No image selected.');
      }
    });
  }
  Widget _buildAvatarTF(){
    return  Container(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image:(AssetImage("images/no_image_avatar.png")) as ImageProvider<Object>,
                    fit: BoxFit.cover)),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[400],
              ),

              child: IconButton(
                  onPressed:pickImageForprofileImage,
                  icon: Icon(Icons.camera_alt_outlined,color: Colors.black,size: 18,)),
            ),
          ),
        ],
      ),
      width: MediaQuery.of(context).size.width/4,
      height: MediaQuery.of(context).size.width/4,
    );
  }
  Widget _buildUsernameTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10.0),
        Text("required",style:TextStyle(
          color:Colors.white54,
        )),
        SizedBox(height:4),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 50.0,
          child: TextFormField(
            controller: usernameController,
            keyboardType: TextInputType.text,
            validator: (input) =>
            input!.length<1 ? "fill this field" : null,
            style: TextStyle(
              color: Colors.black87,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(left: 14.0),
              hintText: 'Username',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }
  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("required",style:TextStyle(
          color:Colors.white54,
        )),
        SizedBox(height:2),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 50.0,
          child: TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            validator: (input) =>
            input!.contains('@') ? "Email Id should be valid" : null,
            style: TextStyle(
              color: Colors.black87,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(left: 14.0),
              hintText: 'Email',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }
  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("required",style:TextStyle(
          color:Colors.white54,
        )),
        SizedBox(height:4),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 50.0,
          child: TextFormField(
            controller: passwordController,
            keyboardType: TextInputType.text,
            validator: (input) => input!.length < 5
                ? "Password should be more than 2 characters"
                : null,
            obscureText: hidePassword,
            style: TextStyle(
              color: Colors.black87,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0, left: 14.0),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    hidePassword = !hidePassword;
                  });
                },
                color: Theme.of(context).accentColor.withOpacity(0.4),
                icon: Icon(
                    hidePassword ? Icons.visibility_off : Icons.visibility),
              ),
              hintText: 'Password',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }
  Widget _buildConfirmPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("required",style:TextStyle(
          color:Colors.white54,
        )),
        SizedBox(height:4),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 50.0,
          child: TextFormField(
            controller: confirmPasswordController,
            keyboardType: TextInputType.text,
            validator: (input) => input==passwordController.text?null:"Passwords doesn\'t match",
            obscureText: hideConfirmPassword,
            style: TextStyle(
              color: Colors.black87,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0, left: 14.0),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    hideConfirmPassword = !hideConfirmPassword;
                  });
                },
                color: Theme.of(context).accentColor.withOpacity(0.4),
                icon: Icon(
                    hideConfirmPassword ? Icons.visibility_off : Icons.visibility),
              ),
              hintText: 'Confirm Password',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }
  Widget _buildPhoneTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("required",style:TextStyle(
          color:Colors.white54,
        )),
        SizedBox(height:4),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 50.0,
          child: TextFormField(
            controller: phoneController,
            keyboardType: TextInputType.phone,
            validator: (input) =>
            input!.length<1 ? "fill this field" : null,
            style: TextStyle(
              color: Colors.black87,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(left: 14.0),
              hintText: 'Phone',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }
  Widget _buildWorkTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 50.0,
          child: TextFormField(
            controller: workController,
            keyboardType: TextInputType.text,
            style: TextStyle(
              color: Colors.black87,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(left: 14.0),
              hintText: 'Work',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }
  Widget _buildWorkAtTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 50.0,
          child: TextFormField(
            controller: workAtController,
            keyboardType: TextInputType.text,
            style: TextStyle(
              color: Colors.black87,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(left: 14.0),
              hintText: 'Work At',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }
  Widget _buildStudyTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 50.0,
          child: TextFormField(
            controller: studyController,
            keyboardType: TextInputType.text,
            style: TextStyle(
              color: Colors.black87,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(left: 14.0),
              hintText: 'Study',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }
  Widget _buildStudyAtTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 50.0,
          child: TextFormField(
            controller: studyAtController,
            keyboardType: TextInputType.text,
            style: TextStyle(
              color: Colors.black87,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(left: 14.0),
              hintText: 'Study at',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }
  Widget _buildLivesInTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 50.0,
          child: TextFormField(
            controller: livesInController,
            keyboardType: TextInputType.text,
            style: TextStyle(
              color: Colors.black87,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(left: 14.0),
              hintText: 'Lives in',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }
  Widget _buildFromTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 50.0,
          child: TextFormField(
            controller: fromController,
            keyboardType: TextInputType.text,
            style: TextStyle(
              color: Colors.black87,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(left: 14.0),
              hintText: 'From',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  Widget _buildSignUpBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          signUp(context,
            email: emailController.text,
            password: passwordController.text,
            phone: phoneController.text,
            username: usernameController.text,
            from: fromController.text,
            livesIn: livesInController.text,
            study: studyController.text,
            studyAt: studyAtController.text,
            work: workController.text,
            workAt: workAtController.text
          );
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Color(0xff520eba),
        child: Text(
          'SIGN UP',
          style: TextStyle(
            color: Color(0xFFFAFAFA),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget _buildSignInWithText() {
    return Column(
      children: <Widget>[
        Text(
          '- OR -',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20.0),
        Text(
          'Sign Up with',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildSocialBtn(Function onTap, AssetImage logo) {
    return GestureDetector(
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
          image: DecorationImage(
            image: logo,
          ),
        ),
      ),
    );
  }

  Widget _buildSocialBtnRow() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildSocialBtn(
                () => print('Login with Facebook'),
            AssetImage(
              'assets/logos/facebook.jpg',
            ),
          ),
          _buildSocialBtn(
                () => print('Login with Google'),
            AssetImage(
              'assets/logos/google.jpg',
            ),
          ),
        ],
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffd7d7d7),
      body: Stack(
        children: [
          Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new ExactAssetImage('images/loginbg.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
            child: new BackdropFilter(
              filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: new Container(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Form(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top:60),
                            child: Container(alignment:Alignment.topLeft,child: IconButton(onPressed: ()=>Navigator.pop(context), icon: Icon(Icons.arrow_back_ios),color: Colors.white,)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top:40,bottom: 20),
                            child: _buildAvatarTF(),
                          ),
                          _buildUsernameTF(), SizedBox(height: 30.0),
                          _buildEmailTF(), SizedBox(height: 30.0,),
                          _buildPasswordTF(), SizedBox(height: 30.0,),
                          _buildConfirmPasswordTF(), SizedBox(height: 30.0),
                          _buildPhoneTF(), SizedBox(height: 30.0),
                          _buildWorkTF(), SizedBox(height: 30.0),
                          _buildWorkAtTF(), SizedBox(height: 30.0),
                          _buildStudyTF(), SizedBox(height: 30.0),
                          _buildStudyAtTF(), SizedBox(height: 30.0),
                          _buildLivesInTF(), SizedBox(height: 30.0),
                          _buildFromTF(), SizedBox(height: 30.0),
                          _buildSignUpBtn(),
                          _buildSignInWithText(),
                          _buildSocialBtnRow(),
                        ],
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
