// File UserModel
// @project flutter-base-bloc-localization-dio
// @author dainq on 9/28/2022

import 'package:json_annotation/json_annotation.dart';

part 'User.g.dart';

@JsonSerializable()
class User {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final DateTime? birthDay;
  final String? address;
  final int? gender;
  final String? phoneNumber;
  final String? frontIdentityCardImage;
  final String? backIdentityCardImage;
  final String? idNo;
  DateTime? issuedOnIdentityCard;
  final String? placeOfIssueIdentityCard;
  final String? avatar;
  final int? balance;
  final int? pofinal;

  final int? typeMoney;
  final int? levelRank;
  final int? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  User(
      this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.birthDay,
      this.address,
      this.gender,
      this.phoneNumber,
      this.frontIdentityCardImage,
      this.backIdentityCardImage,
      this.idNo,
      this.issuedOnIdentityCard,
      this.placeOfIssueIdentityCard,
      this.avatar,
      this.balance,
      this.pofinal,
      this.typeMoney,
      this.levelRank,
      this.status,
      this.createdAt,
      this.updatedAt);

  /// Connect the generated [_$UserFromJson] function to the `fromJson`
  /// factory.
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// Connect the generated [_$UserFromJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
