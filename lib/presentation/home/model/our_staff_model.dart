/// status : "200"
/// data : [{"id":1,"name":"Iftakher Uddin Rishad","email":"rishad@gmail.com","address":"Mirpur 1","phone":"01843080023","image":null,"deleted_at":null,"created_at":null,"updated_at":null},{"id":2,"name":"Sumaiya Akter","email":"sumaiya@gmail.com","address":"Kishoregonj","phone":"01843080027","image":null,"deleted_at":null,"created_at":null,"updated_at":null}]

class OurStaffModel {
  OurStaffModel({
    String? status,
    List<Data>? data,
  }) {
    _status = status;
    _data = data;
  }

  OurStaffModel.fromJson(dynamic json) {
    _status = json['status'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }

  String? _status;
  List<Data>? _data;

  OurStaffModel copyWith({
    String? status,
    List<Data>? data,
  }) =>
      OurStaffModel(
        status: status ?? _status,
        data: data ?? _data,
      );

  String? get status => _status;

  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 1
/// name : "Iftakher Uddin Rishad"
/// email : "rishad@gmail.com"
/// address : "Mirpur 1"
/// phone : "01843080023"
/// image : null
/// deleted_at : null
/// created_at : null
/// updated_at : null

class Data {
  Data({
    num? id,
    String? name,
    String? email,
    String? address,
    String? phone,
    dynamic image,
    dynamic deletedAt,
    dynamic createdAt,
    dynamic updatedAt,
  }) {
    _id = id;
    _name = name;
    _email = email;
    _address = address;
    _phone = phone;
    _image = image;
    _deletedAt = deletedAt;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _address = json['address'];
    _phone = json['phone'];
    _image = json['image'];
    _deletedAt = json['deleted_at'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  num? _id;
  String? _name;
  String? _email;
  String? _address;
  String? _phone;
  dynamic _image;
  dynamic _deletedAt;
  dynamic _createdAt;
  dynamic _updatedAt;

  Data copyWith({
    num? id,
    String? name,
    String? email,
    String? address,
    String? phone,
    dynamic image,
    dynamic deletedAt,
    dynamic createdAt,
    dynamic updatedAt,
  }) =>
      Data(
        id: id ?? _id,
        name: name ?? _name,
        email: email ?? _email,
        address: address ?? _address,
        phone: phone ?? _phone,
        image: image ?? _image,
        deletedAt: deletedAt ?? _deletedAt,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );

  num? get id => _id;

  String? get name => _name;

  String? get email => _email;

  String? get address => _address;

  String? get phone => _phone;

  dynamic get image => _image;

  dynamic get deletedAt => _deletedAt;

  dynamic get createdAt => _createdAt;

  dynamic get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['email'] = _email;
    map['address'] = _address;
    map['phone'] = _phone;
    map['image'] = _image;
    map['deleted_at'] = _deletedAt;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}
