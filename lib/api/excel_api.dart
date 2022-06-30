import 'package:excel_transfer/model/entry_model.dart';
import 'package:gsheets/gsheets.dart';

class ExcelApi {
  static const _sheetId = "";
  static const _credential = r''' {
  "type": "service_account",
  "project_id": "",
  "private_key_id": "",
  "private_key": "",
  "client_email": "",
  "client_id": "",
  "auth_uri": "",
  "token_uri": "",
  "auth_provider_x509_cert_url": "",
  "client_x509_cert_url": ""
}
''';

  static Worksheet? _sheet;
//create custom function init to  initaliazzation
  static Future init() async {
    try {
      final _gsheets = GSheets(_credential);
      // fetch spreadsheet by its id
      final spreadsheet = await _gsheets.spreadsheet(_sheetId);
      // get worksheet by its title
      _sheet = spreadsheet.worksheetByTitle('example');
      _sheet ?? await spreadsheet.addWorksheet('example');
      // var firstentry = Entries.getfiels();
      // await _sheet!.values.insertColumn(1, firstentry);
       var firstentry = ["name"];
      await _sheet!.values.insertColumn(1, firstentry);
    } catch (e) {
      print("init error $e");
    }
  }

  static Future insert(List<Map<String, dynamic>> inpEnterList) async {
    await _sheet!.values.map.appendRows(inpEnterList,fromColumn: 2);
  }

  //   static Future insertName(List<Map<String, dynamic>> inpEnterList) async {
  //   await _sheet!.values.appendRows(inpEnterList);
  // }
    static Future insertName(List<Map<String, dynamic>> inpEnterList) async {
    await _sheet!.values.map.ins(inpEnterList);
  }
}
