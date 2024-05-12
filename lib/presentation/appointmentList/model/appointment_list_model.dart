/// success : "true"
/// message : [{"id":1,"user_id":"9","date":"15/3/2023","description":"eew","timeSlot_id":"5","deleted_at":null,"created_at":"2023-03-13T16:36:00.000000Z","updated_at":"2023-03-16T14:54:14.000000Z","booking_id":"SHC-4961"},{"id":3,"user_id":"9","date":"15/3/2023","description":"dsd","timeSlot_id":"2","deleted_at":null,"created_at":"2023-03-16T14:54:05.000000Z","updated_at":"2023-03-16T14:54:05.000000Z","booking_id":"SHC-9833"},{"id":6,"user_id":"11","date":"5/4/2023","description":null,"timeSlot_id":"2","deleted_at":null,"created_at":"2023-04-06T14:29:30.000000Z","updated_at":"2023-04-06T14:29:30.000000Z","booking_id":"SHC-1366"},{"id":7,"user_id":"13","date":"02/06/2023","description":"confirm","timeSlot_id":"2","deleted_at":null,"created_at":"2023-05-30T15:36:40.000000Z","updated_at":"2023-05-30T15:36:40.000000Z","booking_id":"SHC-6507"},{"id":8,"user_id":"13","date":"09/07/2023","description":"frr","timeSlot_id":"3","deleted_at":null,"created_at":"2023-07-08T02:46:15.000000Z","updated_at":"2023-07-08T02:46:15.000000Z","booking_id":"SHC-4908"},{"id":9,"user_id":"12","date":"14/07/2023","description":"juwel","timeSlot_id":"6","deleted_at":null,"created_at":"2023-07-13T05:38:24.000000Z","updated_at":"2023-07-13T05:38:24.000000Z","booking_id":"SHC-1349"},{"id":10,"user_id":"17","date":"09/03/2023","description":"jnkbh","timeSlot_id":"1","deleted_at":null,"created_at":"2023-09-02T05:52:48.000000Z","updated_at":"2023-09-02T05:52:48.000000Z","booking_id":"SHC-73910"},{"id":11,"user_id":"17","date":"09/03/2023","description":"jnkbh","timeSlot_id":"1","deleted_at":null,"created_at":"2023-09-02T05:53:01.000000Z","updated_at":"2023-09-02T05:53:01.000000Z","booking_id":"SHC-11611"},{"id":12,"user_id":"9","date":"23/1/2024","description":"tt","timeSlot_id":"3","deleted_at":null,"created_at":"2024-01-24T18:57:57.000000Z","updated_at":"2024-01-24T18:57:57.000000Z","booking_id":"SHC-56512"},{"id":13,"user_id":"9","date":"23/1/2024","description":"tt","timeSlot_id":"3","deleted_at":null,"created_at":"2024-01-24T18:58:45.000000Z","updated_at":"2024-01-24T18:58:45.000000Z","booking_id":"SHC-66013"},{"id":14,"user_id":"1","date":"23/1/2024","description":"test","timeSlot_id":"2","deleted_at":null,"created_at":"2024-01-25T16:12:04.000000Z","updated_at":"2024-01-25T16:12:04.000000Z","booking_id":"SHC-51814"},{"id":15,"user_id":"1","date":"23/1/2024","description":"juweloo2","timeSlot_id":"2","deleted_at":null,"created_at":"2024-01-25T16:48:05.000000Z","updated_at":"2024-01-25T16:48:05.000000Z","booking_id":"SHC-88315"},{"id":16,"user_id":"1","date":"23/1/2024","description":"juwel003","timeSlot_id":"3","deleted_at":null,"created_at":"2024-01-25T16:48:28.000000Z","updated_at":"2024-01-25T16:48:28.000000Z","booking_id":"SHC-21316"},{"id":17,"user_id":"1","date":"23/1/2024","description":"juwel003","timeSlot_id":"4","deleted_at":null,"created_at":"2024-01-25T16:49:02.000000Z","updated_at":"2024-01-25T16:49:02.000000Z","booking_id":"SHC-80717"},{"id":18,"user_id":"1","date":"01/26/2024","description":"juwel004","timeSlot_id":"2","deleted_at":null,"created_at":"2024-01-25T16:52:14.000000Z","updated_at":"2024-01-25T16:52:14.000000Z","booking_id":"SHC-25318"},{"id":19,"user_id":"1","date":"01/26/2024","description":"juwel004","timeSlot_id":"2","deleted_at":null,"created_at":"2024-01-25T16:52:21.000000Z","updated_at":"2024-01-25T16:52:21.000000Z","booking_id":"SHC-45919"},{"id":20,"user_id":"9","date":"26/1/2024","description":"tes","timeSlot_id":"2","deleted_at":null,"created_at":"2024-01-28T17:32:18.000000Z","updated_at":"2024-01-28T17:32:18.000000Z","booking_id":"SHC-39520"}]
/// status_code : 200

class AppointmentListModel {
  AppointmentListModel({
      String? success, 
      List<Message>? message, 
      var statusCode,}){
    _success = success;
    _message = message;
    _statusCode = statusCode;
}

  AppointmentListModel.fromJson(dynamic json) {
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
  var _statusCode;
AppointmentListModel copyWith({  String? success,
  List<Message>? message,
  var statusCode,
}) => AppointmentListModel(  success: success ?? _success,
  message: message ?? _message,
  statusCode: statusCode ?? _statusCode,
);
  String? get success => _success;
  List<Message>? get message => _message;
   get statusCode => _statusCode;

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
/// user_id : "9"
/// date : "15/3/2023"
/// description : "eew"
/// timeSlot_id : "5"
/// deleted_at : null
/// created_at : "2023-03-13T16:36:00.000000Z"
/// updated_at : "2023-03-16T14:54:14.000000Z"
/// booking_id : "SHC-4961"

class Message {
  Message({
      var id, 
      String? userId, 
      String? date, 
      String? description, 
      String? timeSlotId, 
      dynamic deletedAt, 
      String? createdAt, 
      String? updatedAt, 
      String? bookingId,}){
    _id = id;
    _userId = userId;
    _date = date;
    _description = description;
    _timeSlotId = timeSlotId;
    _deletedAt = deletedAt;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _bookingId = bookingId;
}

  Message.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _date = json['date'];
    _description = json['description'];
    _timeSlotId = json['timeSlot_id'];
    _deletedAt = json['deleted_at'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _bookingId = json['booking_id'];
  }
  var _id;
  String? _userId;
  String? _date;
  String? _description;
  String? _timeSlotId;
  dynamic _deletedAt;
  String? _createdAt;
  String? _updatedAt;
  String? _bookingId;
Message copyWith({  var id,
  String? userId,
  String? date,
  String? description,
  String? timeSlotId,
  dynamic deletedAt,
  String? createdAt,
  String? updatedAt,
  String? bookingId,
}) => Message(  id: id ?? _id,
  userId: userId ?? _userId,
  date: date ?? _date,
  description: description ?? _description,
  timeSlotId: timeSlotId ?? _timeSlotId,
  deletedAt: deletedAt ?? _deletedAt,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  bookingId: bookingId ?? _bookingId,
);
   get id => _id;
  String? get userId => _userId;
  String? get date => _date;
  String? get description => _description;
  String? get timeSlotId => _timeSlotId;
  dynamic get deletedAt => _deletedAt;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get bookingId => _bookingId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['date'] = _date;
    map['description'] = _description;
    map['timeSlot_id'] = _timeSlotId;
    map['deleted_at'] = _deletedAt;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['booking_id'] = _bookingId;
    return map;
  }

}