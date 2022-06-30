import 'package:auto_size_text/auto_size_text.dart';
import 'package:excel_transfer/api/excel_api.dart';
import 'package:excel_transfer/model/addUserModel.dart';
import 'package:excel_transfer/model/user_input_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class addUser extends StatefulWidget {
  const addUser({Key? key}) : super(key: key);

  @override
  _addUserState createState() => _addUserState();
}


class _addUserState extends State<addUser> {

  TextEditingController textController = TextEditingController();

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: const Color(0xFF3474E0),
        automaticallyImplyLeading: true,
        title: Text(
          'Excel-Transfer',
          style: GoogleFonts.getFont(
            'Poppins',
            color: const Color(0xFFFFFFFF),
            fontSize: 30,
          ),
        ),
        actions: [],
        centerTitle: true,
      ),
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(30, 40, 30, 25),
              child: TextFormField(
                controller: textController,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Name',
                  hintStyle: GoogleFonts.getFont(
                    'Poppins',
                    // color: Colors.black,
                    fontSize: 18,
                  ),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF00D43B),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF00D43B),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                ),
                style: GoogleFonts.getFont(
                  'Poppins',
                  // color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(40, 25, 40, 20),
              child: MaterialButton(
                elevation: 1,
                onPressed: () async {
                  print('Button pressed ...');
                  final useradd = [
                    addUserModel(
                        name: textController.text,
                        
                      ),
                    //  UserInput(name: name, milk: "c", liters: "uif"),
                  ];
                  final convJson = useradd.map((usr) => usr.toMap()).toList();
                  await ExcelApi.insertName(convJson);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.add_rounded,
                      size: 15,
                      color: Colors.white,
                    ),
                    Text(
                      'Add Data',
                      style: GoogleFonts.getFont(
                        'Poppins',
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                minWidth: double.infinity,
                height: 50,
                color: const Color(0xFF1AB108),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide.none),
              ),
            ),
   
          ],
        ),
      ),
    );
  }
}
