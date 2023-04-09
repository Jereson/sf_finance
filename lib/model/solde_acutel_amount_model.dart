class SoldeAcutelAmountModel {
  String? id;
  String? soldeCent;
  String? soldeActuelAmount;
  String? venirAmount;
  String? venirCent;

  SoldeAcutelAmountModel(
      {this.id,
      this.soldeCent,
      this.soldeActuelAmount,
      this.venirAmount,
      this.venirCent});

  SoldeAcutelAmountModel.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["soldeCent"] is String) {
      soldeCent = json["soldeCent"];
    }
    if (json["soldeActuelAmount"] is String) {
      soldeActuelAmount = json["soldeActuelAmount"];
    }
    if (json["venirAmount"] is String) {
      venirAmount = json["venirAmount"];
    }
    if (json["venirCent"] is String) {
      venirCent = json["venirCent"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["soldeCent"] = soldeCent;
    _data["soldeActuelAmount"] = soldeActuelAmount;
    _data["venirAmount"] = venirAmount;
    _data["venirCent"] = venirCent;
    return _data;
  }
}
