import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:google_fonts/google_fonts.dart';

class EnterSheetId extends StatelessWidget {
  const EnterSheetId({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return Form(
      key: formKey,
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFF5F5F5),
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 2,
                child: Align(
                  alignment: AlignmentDirectional(0, 1),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Color(0xFFFAA800),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4,
                            color: Color(0xFFC4C4C4),
                            offset: Offset(0, 4),
                          )
                        ],
                        borderRadius: BorderRadius.circular(20),
                        shape: BoxShape.rectangle,
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0, -0.3),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                          child: AutoSizeText(
                            'Enter Sheet ID',
                            textAlign: TextAlign.start,
                            style: GoogleFonts.getFont(
                              'Roboto',
                              color: Color(0xFF000000),
                              fontWeight: FontWeight.w300,
                              fontSize: 50,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(0, -0.65),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                    child: TextFormField(
                      // onChanged: (_) => EasyDebounce.debounce(
                      //   'textController',
                      //   Duration(milliseconds: 2000),
                      //   () => setState(() {}),
                      // ),
                      controller: textController,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'Enter SheetID',
                        hintStyle: GoogleFonts.getFont(
                          'Poppins',
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                        ),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        filled: true,
                        fillColor: Color(0x78FAA800),
                      ),
                      style: GoogleFonts.getFont(
                        'Poppins',
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.multiline,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'This is Mandatory Field';
                        }

                        return null;
                      },
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(0, -1),
                  child:
                      Material(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.transparent,
                    clipBehavior: Clip.antiAlias,
                    child: Ink(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Color(0xFF1AB108),
                        border: Border.all(
                          color:  Colors.transparent,
                            // width: borderWidth ?? 0,
                            ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.chevron_right_outlined,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () {
                          print('IconButton pressed ...');
                        },
                        splashRadius: MediaQuery.of(context).size.width,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
