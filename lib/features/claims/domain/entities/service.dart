import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Service extends Equatable {
  final int id;
  final String name;
  final double rate;

  Service({
    required this.id,
    required this.name,
    required this.rate
  });

    @override
  List<Object?> get props => [id];
}