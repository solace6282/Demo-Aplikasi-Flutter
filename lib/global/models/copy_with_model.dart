// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../models.dart';
class CopyWithModel<T> extends Equatable {
  final T? value;
  const CopyWithModel({
    required this.value,
  });

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [value];
}
