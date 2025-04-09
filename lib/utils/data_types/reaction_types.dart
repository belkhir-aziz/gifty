import 'package:json_annotation/json_annotation.dart';

@JsonEnum(alwaysCreate: true)
enum ReactionTypes { like, dislike, superLike }