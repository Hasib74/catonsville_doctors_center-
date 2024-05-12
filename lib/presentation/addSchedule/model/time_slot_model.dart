/// success : "true"
/// message : [{"id":1,"time_from":"8.00 AM","time_to":"9.00 AM","deleted_at":null,"created_at":null,"updated_at":null},{"id":2,"time_from":"9.01 AM","time_to":"10.00 AM","deleted_at":null,"created_at":null,"updated_at":null},{"id":3,"time_from":"10.01 AM","time_to":"11.00 AM","deleted_at":null,"created_at":null,"updated_at":null},{"id":4,"time_from":"11.01 AM","time_to":"12.00 PM","deleted_at":null,"created_at":null,"updated_at":null},{"id":5,"time_from":"12.01 PM","time_to":"1.00 PM","deleted_at":null,"created_at":null,"updated_at":null},{"id":6,"time_from":"1.01 PM","time_to":"2.00 PM","deleted_at":null,"created_at":null,"updated_at":null},{"id":7,"time_from":"2.01 PM","time_to":"3.00 PM","deleted_at":null,"created_at":null,"updated_at":null},{"id":8,"time_from":"3.01 PM","time_to":"4.00 PM","deleted_at":null,"created_at":null,"updated_at":null}]
/// status_code : 200

class TimeSlotModel {
  TimeSlotModel({
    String? success,
    List<Message>? message,
    num? statusCode,
  }) {
    _success = success;
    _message = message;
    _statusCode = statusCode;
  }

  TimeSlotModel.fromJson(dynamic json) {
    _success = json['success'];
    if (json['message'] != null) {
      _message = [];
      json['message'].forEach((v) {
        _message?.add(Message.fromJson(v));
      });
    }
    _statusCode = json['status_code'];
  }

  String? _success;
  List<Message>? _message;
  num? _statusCode;

  TimeSlotModel copyWith({
    String? success,
    List<Message>? message,
    num? statusCode,
  }) =>
      TimeSlotModel(
        success: success ?? _success,
        message: message ?? _message,
        statusCode: statusCode ?? _statusCode,
      );

  String? get success => _success;

  List<Message>? get message => _message;

  num? get statusCode => _statusCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    if (_message != null) {
      map['message'] = _message?.map((v) => v.toJson()).toList();
    }
    map['status_code'] = _statusCode;
    return map;
  }
}

/// id : 1
/// time_from : "8.00 AM"
/// time_to : "9.00 AM"
/// deleted_at : null
/// created_at : null
/// updated_at : null

class Message {
  Message({
    num? id,
    String? timeFrom,
    String? timeTo,
    String? day,
    dynamic deletedAt,
    dynamic createdAt,
    dynamic updatedAt,
  }) {
    _id = id;
    _timeFrom = timeFrom;
    _timeTo = timeTo;
    _deletedAt = deletedAt;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Message.fromJson(dynamic json) {
    _id = json['id'];
    _timeFrom = json['time_from'];
    _timeTo = json['time_to'];
    _day = json['day'];
    _deletedAt = json['deleted_at'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  num? _id;
  String? _timeFrom;
  String? _timeTo;
  dynamic _deletedAt;
  dynamic _createdAt;
  dynamic _updatedAt;
  String? _day;

  Message copyWith({
    num? id,
    String? timeFrom,
    String? timeTo,
    dynamic deletedAt,
    dynamic createdAt,
    dynamic updatedAt,
  }) =>
      Message(
        id: id ?? _id,
        timeFrom: timeFrom ?? _timeFrom,
        timeTo: timeTo ?? _timeTo,
        deletedAt: deletedAt ?? _deletedAt,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );

  num? get id => _id;

  String? get timeFrom => _timeFrom;

  String? get timeTo => _timeTo;

  String? get day => _day;

  dynamic get deletedAt => _deletedAt;

  dynamic get createdAt => _createdAt;

  dynamic get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['time_from'] = _timeFrom;
    map['time_to'] = _timeTo;
    map['deleted_at'] = _deletedAt;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}
