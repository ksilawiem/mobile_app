import 'package:json_annotation/json_annotation.dart';


part 'user.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name : 'id')
  String? id;
  @JsonKey(name : 'firstName')
  String? firstName;
  @JsonKey(name : 'lastName')
  String? lastName;
  @JsonKey(name : 'address')
  String? address;
  @JsonKey(name : 'city')
  String? city;
  @JsonKey(name : 'birthdate')
  String? birthdate;
  @JsonKey(name : 'gender')
  String? gender;
  @JsonKey(name : 'role')
  double? role;
  @JsonKey(name : 'email_verified')
  double? email_verified;
  @JsonKey(name : 'cv')
  String? cv;
  @JsonKey(name : 'photo')
  String? photo;
  @JsonKey(name : 'company')
  String? company;
  @JsonKey(name : 'modePayment')
  String? modePayment;
  @JsonKey(name : 'linkedin')
  String? linkedin;
  @JsonKey(name : 'twitter')
  String? twitter;
  @JsonKey(name : 'created_at')
  String? created_at;
  @JsonKey(name : 'updated_at')
  String? updated_at;
  //  @JsonKey(name : 'sickBalance')
  // int? sickBalance;



  User(
      {this.id,
      this.firstName,
      this.lastName,
      this.address,
      this.city,
      this.birthdate,
      this.gender,
      this.role,
      this.email_verified,
      this.cv,
      this.photo,
      this.company,
      this.modePayment,
      this.linkedin,
      this.twitter,
      this.created_at,
      this.updated_at,
      });

      factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

