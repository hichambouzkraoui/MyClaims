import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'service.dart';

class Session extends Equatable {
  final int id;
  final DateTime expenseDate;
  final Service service;
  late  double quantity;
  late double miscellaneous;
  late double total;
  late String comment;

  Session({
    required this.id,
    required this.expenseDate,
    required this.service,
    required this.quantity,
    required this.miscellaneous,
    required this.total,
    required this.comment,
  });
  @override
  List<Object?> get props => [id];
}