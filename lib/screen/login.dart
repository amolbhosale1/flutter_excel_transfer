import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}
var errorMessage="";
class _LoginState extends State<Login> {
  final TextEditingController _emailFieldController = TextEditingController();
  final TextEditingController _passwordFieldController =
      TextEditingController();
  bool _passwordFieldVisibility = false;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.always,
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFFF5F5F5),
        body: SafeArea(
          child: Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(0, -1),
                child: Image.network(
                  'https://picsum.photos/seed/483/300',
                  width: double.infinity,
                  height: 275,
                  fit: BoxFit.cover,
                ),
                // child: Image.asset(
                //   "assets/images/background.jpg",
                //   width: double.infinity,
                //   height: 275,
                //   fit: BoxFit.cover,
                // ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                        color: Color(0x00EEEEEE),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      width: double.infinity,
                      height: 100,
                      decoration: BoxDecoration(
                        color: const Color(0xFFEEEEEE),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(0, -0.65),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 34, 0, 12),
                                child: Image.network(
                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/flutterflow_assets/ff_logo.png',
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      4, 0, 0, 20),
                                  child: Container(
                                    width: 300,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFE0E0E0),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              20, 0, 20, 0),
                                      child: TextFormField(
                                        controller: _emailFieldController,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          hintText: 'Email',
                                          hintStyle: GoogleFonts.getFont(
                                            'Open Sans',
                                            color: const Color(0xFF455A64),
                                            fontWeight: FontWeight.normal,
                                          ),
                                          enabledBorder:
                                              const UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedBorder:
                                              const UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                        ),
                                        style: GoogleFonts.getFont(
                                          'Open Sans',
                                          color: const Color(0xFF455A64),
                                          fontWeight: FontWeight.normal,
                                        ),
                                        validator: (value) {
                                          if (!RegExp(
                                                  "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                              .hasMatch(value!)) {
                                             return "Please Enter a valid email";
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                               
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      4, 0, 4, 20),
                                  child: Container(
                                    width: 300,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFE0E0E0),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              20, 0, 20, 0),
                                      child: TextFormField(
                                        controller: _passwordFieldController,
                                        obscureText: !_passwordFieldVisibility,
                                        decoration: InputDecoration(
                                          hintText: 'Password',
                                          hintStyle: GoogleFonts.getFont(
                                            'Open Sans',
                                            color: const Color(0xFF455A64),
                                            fontWeight: FontWeight.normal,
                                          ),
                                          enabledBorder:
                                              const UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedBorder:
                                              const UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          suffixIcon: InkWell(
                                            onTap: () => setState(
                                              () => _passwordFieldVisibility =
                                                  !_passwordFieldVisibility,
                                            ),
                                            child: Icon(
                                              _passwordFieldVisibility
                                                  ? Icons.visibility_outlined
                                                  : Icons
                                                      .visibility_off_outlined,
                                              size: 22,
                                            ),
                                          ),
                                        ),
                                        style: GoogleFonts.getFont(
                                          'Open Sans',
                                          color: const Color(0xFF455A64),
                                          fontWeight: FontWeight.normal,
                                        ),
                                        validator: (val) {
                                          if (val!.isEmpty) {
                                            return 'Enter Password';
                                          }
                                          if (val.length < 6) {
                                            return 'Minimum length 6';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 20),
                                  child: MaterialButton(
                                    onPressed: () async {
                                      signIn(_emailFieldController.text,
                                          _passwordFieldController.text);
                                    },
                                    child: Text(
                                      'Sign in',
                                      style: GoogleFonts.getFont(
                                        'Open Sans',
                                        color: const Color(0xFFDEDEDE),
                                        fontSize: 16,
                                      ),
                                    ),
                                    minWidth: 300,
                                    height: 50,
                                    color: const Color(0xFF292C3B),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(28),
                                        side: BorderSide.none),
                                    
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 10),
                                  child: TextButton(onPressed: (){
                                    //  if (_emailFieldController.text.isEmpty) {
                                    //   ScaffoldMessenger.of(context).showSnackBar(
                                    //     const SnackBar(
                                    //       content: Text(
                                    //         'Email required!',
                                    //       ),
                                    //     ),
                                    //   );
                                    //   return;
                                    // }
                                    // await resetPassword(
                                    //   email: _emailFieldController.text,
                                    //   context: context,
                                    // );
                                  }, child: Text('Forgot password?',style: GoogleFonts.getFont(
                                      'Open Sans',
                                      fontSize: 14,
                                      color: const Color(0xFF455A64),
                                    ),),
                                   ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0, 0),
                                  child: SizedBox(
                                    width: 230,
                                    height: 44,
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(0, 0),
                                          child: ElevatedButton(
                                            onPressed: () async {
                                              // final user =
                                              //     await signInWithGoogle(
                                              //         context);
                                              // if (user == null) {
                                              //   return;
                                              // }
                                              // await Navigator
                                              //     .pushAndRemoveUntil(
                                              //   context,
                                              //   MaterialPageRoute(
                                              //     builder: (context) =>
                                              //         HomePageWidget(),
                                              //   ),
                                              //   (r) => false,
                                              // );
                                            },

                                            style: ElevatedButton.styleFrom(
                                                primary: Colors.white,
                                                minimumSize:
                                                    const Size(230, 44),
                                                elevation: 4,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  side: const BorderSide(
                                                    color: Colors.transparent,
                                                    width: 0,
                                                  ),
                                                )),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const Icon(
                                                  Icons.add,
                                                  color: Colors.transparent,
                                                  size: 20,
                                                ),
                                                Text(
                                                  'Sign in with Google',
                                                  style: GoogleFonts.getFont(
                                                    'Roboto',
                                                    color:
                                                        const Color(0xFF606060),
                                                    fontSize: 17,
                                                  ),
                                                )
                                              ],
                                            ),

                                            // width: 230,
                                            // height: 44,

                                            // borderSide: BorderSide(
                                            //   color: Colors.transparent,
                                            //   width: 0,
                                            // ),
                                            // borderRadius: 12,
                                          ),
                                        ),
                                        Align(
                                          alignment: const AlignmentDirectional(
                                              -0.83, 0),
                                          child: Container(
                                            width: 22,
                                            height: 22,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.network(
                                              'https://i0.wp.com/nanophorm.com/wp-content/uploads/2018/04/google-logo-icon-PNG-Transparent-Background.png?w=1000&ssl=1',
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 12, 0, 10),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0, 0, 10, 0),
                                        child: Text(
                                          'Don\'t have an account?',
                                          style: GoogleFonts.getFont(
                                            'Open Sans',
                                            color: const Color(0xFFADADAD),
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'Sign Up',
                                        style: GoogleFonts.getFont(
                                          'Open Sans',
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void signIn(String email, String password) async {
    if (formKey.currentState!.validate()) {
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
              print("login"),
                  Get.snackbar("Login", "Login Sucess",
                      colorText: Colors.white,
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.black87),
                      // Get.to(demo()),
                });
      } on FirebaseAuthException catch (error) {
        //  var errorMessage;
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";

            break;
          case "auth/wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "auth/user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
      //  return errorMessage;
        //print(error.code);

      }
    }
  }
}
