// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Meta<M> _$MetaFromJson<M>(Map<String, dynamic> json) => Meta<M>(
      success: json['success'] as bool,
      error: json['error'] as String,
    );

Map<String, dynamic> _$MetaToJson<M>(Meta<M> instance) => <String, dynamic>{
      'success': instance.success,
      'error': instance.error,
    };
