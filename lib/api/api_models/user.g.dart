// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      address: json['address'] as String?,
      city: json['city'] as String?,
      birthdate: json['birthdate'] as String?,
      gender: json['gender'] as String?,
      role: (json['role'] as num?)?.toDouble(),
      email_verified: (json['email_verified'] as num?)?.toDouble(),
      cv: json['cv'] as String?,
      photo: json['photo'] as String?,
      company: json['company'] as String?,
      modePayment: json['modePayment'] as String?,
      linkedin: json['linkedin'] as String?,
      twitter: json['twitter'] as String?,
      created_at: json['created_at'] as String?,
      updated_at: json['updated_at'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'address': instance.address,
      'city': instance.city,
      'birthdate': instance.birthdate,
      'gender': instance.gender,
      'role': instance.role,
      'email_verified': instance.email_verified,
      'cv': instance.cv,
      'photo': instance.photo,
      'company': instance.company,
      'modePayment': instance.modePayment,
      'linkedin': instance.linkedin,
      'twitter': instance.twitter,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };
