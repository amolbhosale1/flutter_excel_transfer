import 'package:excel_transfer/model/entry_model.dart';

class UserInput {
  final String? name;
  final String? milk;
  final String? liters;
  //final DateTime? dateTime;

  const UserInput({this.name, this.milk, this.liters 
  });

  Map<String, dynamic> tojson() => {
        Entries.name: name,
        Entries.milk: milk,
        Entries.liters:liters,
      };
}
