import 'package:excel_transfer/api/excel_api.dart';
import 'package:excel_transfer/model/user_input_model.dart';
import 'package:excel_transfer/screen/add_user.dart';
import 'package:excel_transfer/screen/enterSheetId.dart';
import 'package:excel_transfer/screen/login.dart';
import 'package:excel_transfer/screen/mainDetail.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options:const FirebaseOptions(
   apiKey: "AIzaSyCuJaFCn4cyKalaRWK7Eb_GP3ioOWP-ZkQ",
      projectId: "flutter-excel-b25b2",
      messagingSenderId: "581027942352",
      appId: "1:581027942352:web:7d85885c69bcef4b7bf3d5",
  ));
  await ExcelApi.init();
  runApp(const MyApp());
}

//16YRC832dGxw3iPct45tSdmzs4gQSFs0kVDhLcXFRMTI
//amoldev@flutter-excel-334809.iam.gserviceaccount.com
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: mainDetails(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final TextEditingController inName = TextEditingController();
//   final TextEditingController inmilk = TextEditingController();
//   final TextEditingController inadd = TextEditingController();
//   String DefDrop = '1';
//   String? dropMilk;
//   final GlobalKey<FormState> _inpdata = GlobalKey<FormState>();

  // void _insertToSheet() async {
  //   // setState(() {
  //   //   _counter++;
  //   // });
  //   final useradd = [
  //     UserInput(
  //         name: inName.text,
  //         milk: inmilk.text,
  //         add: inadd.text,
  //         liters: DefDrop),
  //      UserInput(name: "cc", milk: "c", add: "uif"),
  //   ];
  //   final convJson = useradd.map((usr) => usr.tojson()).toList();
  //   await ExcelApi.insert(convJson);
  // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Form(
//           key: _inpdata,
//           child: Column(
//             children: [
//               TextFormField(
//                 controller: inName,
//                 decoration: const InputDecoration(
//                   hintText: 'Enter Name',
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter some text';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               DropdownButton(
//                 value: DefDrop,
//                 items: <String>['1', '2', '3', '4']
//                     .map<DropdownMenuItem<String>>((String value) {
//                   return DropdownMenuItem<String>(
//                     value: value,
//                     child: Text(value),
//                   );
//                 }).toList(),
//                 onChanged: (String? val) {
//                   setState(() {
//                     DefDrop = val!;
//                   });
//                 },
//               ),
//               DropdownButton(
//                 value: dropMilk,
//                 items: <String>["cow","bufello"]
//                     .map<DropdownMenuItem<String>>((String value) {
//                   return DropdownMenuItem<String>(
//                     value: value,
//                     child: Text(value),
//                   );
//                 }).toList(),
//                 onChanged: (String? val) {
//                   setState(() {
//                     dropMilk = val.toString();
//                   });
//                 },
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               TextFormField(
//                 controller: inadd,
//                 decoration: const InputDecoration(
//                   hintText: 'Enter address',
//                 ),
//                 validator: (String? value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter some text';
//                   }
//                   return null;
//                 },
//               ),
//             ],
//           )),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           if (_inpdata.currentState!.validate()) {
//             _insertToSheet();
//           }
//         },
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
