/// success : "true"
/// response : [{"id":4,"name":"Women’s Haircut","price":"60.00000","description":"Lorem","image":"20220928040929.jpeg","created_at":"2022-09-11T06:18:23.000000Z","updated_at":"2022-09-28T16:34:29.000000Z"},{"id":5,"name":"Men’s Haircut","price":"38.00000","description":"Lorem Ipsum is simply dummy text of the printing and typesetting industry","image":"20220928040922.jpg","created_at":"2022-09-28T15:35:47.000000Z","updated_at":"2022-09-28T16:33:22.000000Z"},{"id":6,"name":"Children's Haircuts","price":"25.00000","description":"Lorem Ipsum is simply dummy text of the printing and typesetting industry","image":"20220928040946.webp","created_at":"2022-09-28T16:35:46.000000Z","updated_at":"2022-09-28T16:35:46.000000Z"},{"id":7,"name":"Body Waxing","price":"75.00000","description":"Lorem Ipsum is simply dummy text of the printing and typesetting industry","image":"20220928040909.webp","created_at":"2022-09-28T16:37:09.000000Z","updated_at":"2022-09-28T16:37:09.000000Z"},{"id":8,"name":"Nail Services","price":"34.00000","description":"Lorem Ipsum is simply dummy text of the printing and typesetting industry","image":"20220928040958.webp","created_at":"2022-09-28T16:37:58.000000Z","updated_at":"2022-09-28T16:37:58.000000Z"}]
/// status_code : 200

class ServiceListModel {
  ServiceListModel({
    String? success,
    List<Response>? response,
    num? statusCode,
  }) {
    _success = success;
    _response = response;
    _statusCode = statusCode;
  }

  ServiceListModel.fromJson(dynamic json) {
    _success = json['success'];
    if (json['response'] != null) {
      _response = [];
      json['response'].forEach((v) {
        _response?.add(Response.fromJson(v));
      });
    }
    _statusCode = json['status_code'];
  }

  String? _success;
  List<Response>? _response;
  num? _statusCode;

  ServiceListModel copyWith({
    String? success,
    List<Response>? response,
    num? statusCode,
  }) =>
      ServiceListModel(
        success: success ?? _success,
        response: response ?? _response,
        statusCode: statusCode ?? _statusCode,
      );

  String? get success => _success;

  List<Response>? get response => _response;

  num? get statusCode => _statusCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    if (_response != null) {
      map['response'] = _response?.map((v) => v.toJson()).toList();
    }
    map['status_code'] = _statusCode;
    return map;
  }
}

/// id : 4
/// name : "Women’s Haircut"
/// price : "60.00000"
/// description : "Lorem"
/// image : "20220928040929.jpeg"
/// created_at : "2022-09-11T06:18:23.000000Z"
/// updated_at : "2022-09-28T16:34:29.000000Z"

class Response {
  Response({
    num? id,
    String? name,
    String? price,
    String? description,
    String? image,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _name = name;
    _price = price;
    _description = description;
    _image = image;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Response.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _price = json['price'];
    _description = json['description'];
    _image = json['image'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  num? _id;
  String? _name;
  String? _price;
  String? _description;
  String? _image;
  String? _createdAt;
  String? _updatedAt;

  Response copyWith({
    num? id,
    String? name,
    String? price,
    String? description,
    String? image,
    String? createdAt,
    String? updatedAt,
  }) =>
      Response(
        id: id ?? _id,
        name: name ?? _name,
        price: price ?? _price,
        description: description ?? _description,
        image: image ?? _image,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );

  num? get id => _id;

  String? get name => _name;

  String? get price => _price;

  String? get description => _description;

  String? get image => _image;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['price'] = _price;
    map['description'] = _description;
    map['image'] = _image;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}
