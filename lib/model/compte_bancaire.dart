
class CompteBancaireModel {
  String? id;
  String? amount;
  String? colorCode;
  String? cent;
  String? date;
  String? imageUrl;
  String? title;

  CompteBancaireModel({this.id,this.amount, this.colorCode, this.cent,this.date, this.imageUrl, this.title});

  CompteBancaireModel.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
    }
     if(json["amount"] is String) {
      amount = json["amount"];
    }
    if(json["colorCode"] is String) {
      colorCode = json["colorCode"];
    }
    if(json["cent"] is String) {
      cent = json["cent"];
    }
    if(json["date"] is String) {
      date = json["date"];
    }
    if(json["imageUrl"] is String) {
      imageUrl = json["imageUrl"];
    }
    if(json["title"] is String) {
      title = json["title"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["amount"] = amount;
    _data["colorCode"] = colorCode;
    _data["cent"] = cent;
    _data["date"] = date;
    _data["imageUrl"] = imageUrl;
    _data["title"] = title;
    return _data;
  }
}