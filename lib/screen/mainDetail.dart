import 'package:auto_size_text/auto_size_text.dart';
import 'package:excel_transfer/api/excel_api.dart';
import 'package:excel_transfer/model/user_input_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class mainDetails extends StatefulWidget {
  const mainDetails({Key? key}) : super(key: key);

  @override
  _mainDetailsState createState() => _mainDetailsState();
}

String? dropDownLiter;
String? dropDownMilk;
List<String> get effectiveOptionsLiter =>
    ['0.5', '1', '1.5', '2', '2.5', '3'].toList();
List<String> get effectiveOptionsMilk => ['Cow', 'Bufello'].toList();

class _mainDetailsState extends State<mainDetails> {
  String? milk;
  TextEditingController textController = TextEditingController();
  String? liter;
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
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                    // child: FFButtonWidget(

                    //     borderSide: BorderSide(
                    //       color: Colors.transparent,
                    //       width: 1,
                    //     ),
                    //     borderRadius: 12,
                    //   ),
                    child: MaterialButton(
                      onPressed: () async {},
                      child: Text(
                        'Copy Last Day',
                        style: GoogleFonts.getFont(
                          'Poppins',
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      minWidth: 130,
                      height: 40,
                      color: const Color(0xFF3474E0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide.none),
                    )),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                  child:
                      // FlutterFlowIconButton(
                      //   //  borderColor: Colors.transparent,
                      //  //   borderRadius: 20,
                      //     //buttonSize: 40,
                      //     fillColor: FlutterFlowTheme.primaryColor,

                      Material(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.transparent,
                    child: Ink(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFF3474E0),
                        border: Border.all(
                          color: Colors.transparent,
                          // width: borderWidth ?? 0,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.calendar_today,
                          color: Colors.white,
                          size: 20,
                        ),
                        onPressed: () {
                          print('IconButton pressed ...');
                        },
                        splashRadius: MediaQuery.of(context).size.width,
                      ),
                    ),
                  ),
                ),
              ],
            ),
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
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 25),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 50,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                    border: Border.all(
                      color: Colors.transparent,
                      width: 0,
                    ),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                    child: DropdownButton<String>(
                      hint: const Text('Milk'),
                      underline: Container(color: Colors.transparent),
                      value: dropDownMilk,
                      items: effectiveOptionsMilk
                          .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(
                                  e,
                                  style: GoogleFonts.getFont(
                                    'Poppins',
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                ),
                              ))
                          .toList(),
                      elevation: 2,
                      onChanged: (val) => setState(() => dropDownMilk = val),
                      isExpanded: true,
                      dropdownColor: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 25),
              child:
                  //   hidesUnderline: true,
                  SizedBox(
                width: 180,
                height: 50,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                    border: Border.all(
                      color: Colors.transparent,
                      width: 0,
                    ),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                    child: DropdownButton<String>(
                      hint: const Text('Liters'),
                      underline: Container(color: Colors.transparent),
                      value: dropDownLiter,
                      items: effectiveOptionsLiter
                          .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(
                                  e,
                                  style: GoogleFonts.getFont(
                                    'Poppins',
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                ),
                              ))
                          .toList(),
                      elevation: 2,
                      onChanged: (val) => setState(() => dropDownLiter = val!),
                      isExpanded: true,
                      dropdownColor: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 25),
              child: AutoSizeText(
                'Todays Date Waiting...',
                textAlign: TextAlign.center,
                style: GoogleFonts.getFont(
                  'Poppins',
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
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
                    UserInput(
                        name: textController.text,
                        milk: dropDownMilk,
                        liters: dropDownLiter),
                    //  UserInput(name: name, milk: "c", liters: "uif"),
                  ];
                  final convJson = useradd.map((usr) => usr.tojson()).toList();
                  await ExcelApi.insert(convJson);
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
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(40, 0, 40, 20),
              child: MaterialButton(
                elevation: 1,
                onPressed: () {
                  print('Button pressed ...');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.add_rounded,
                      size: 18,
                      color: Colors.white,
                    ),
                    Text(
                      'Remove Todays Data',
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
                color: const Color(0xFFDA0808),
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
