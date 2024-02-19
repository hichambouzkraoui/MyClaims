import 'package:dartz/dartz.dart';
import 'package:myclaims/core/error/failures.dart';

import '../entities/service.dart';

abstract class ServiceRepository {
  Future<Either<Failure, Service>> get( String name);
  Future<Either<Failure, Service>> list();
}