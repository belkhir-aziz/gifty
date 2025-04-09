import 'package:json_annotation/json_annotation.dart';

@JsonEnum(alwaysCreate: true)
enum InvitationStatus { accepted, rejected, pending }