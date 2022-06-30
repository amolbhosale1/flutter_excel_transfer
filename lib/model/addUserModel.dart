class addUserModel {
  final String? name;
 // final int? id;

  const addUserModel({
    this.name,
  //  this.id
  });

  Map<String, dynamic> toMap() => {
        "name": name,
      };

}
