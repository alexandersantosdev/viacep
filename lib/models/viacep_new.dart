class ViaCepNewModel {
  String? objectId;
  String? createdAt;

  ViaCepNewModel({this.objectId, this.createdAt});

  ViaCepNewModel.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['objectId'] = objectId;
    data['createdAt'] = createdAt;
    return data;
  }
}
