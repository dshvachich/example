import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  User({
    required this.userId,
    this.phone,
    this.name,
    this.avatar,
  });

  int userId;
  String? phone;
  String? name;
  String? avatar;

  String get formattedPhone {
    if (phone == null) {
      return '';
    }
    return phone!.substring(0, 2) +
        " (" +
        phone!.substring(2, 5) +
        ") " +
        phone!.substring(5, 8) +
        " " +
        phone!.substring(8, 10) +
        " " +
        phone!.substring(10, 12);
  }

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
