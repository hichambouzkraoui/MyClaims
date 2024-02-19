import 'package:dartz/dartz.dart';
import 'package:myclaims/core/error/failures.dart';

import '../entities/session.dart';

abstract class SessionRepository {
  Future<Either<Failure, Session>> getById( int id);
  Future<Either<Failure, List<Session>>> list();
}