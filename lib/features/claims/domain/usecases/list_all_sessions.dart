import 'package:dartz/dartz.dart';
import 'package:myclaims/core/error/failures.dart';
import 'package:myclaims/core/usecases/usecase.dart';
import 'package:myclaims/features/claims/domain/entities/session.dart';
import 'package:myclaims/features/claims/domain/repositories/session_repository.dart';

class ListAllSessions implements UseCase<List<Session>,NoParams> {
  SessionRepository sessionRepository;
  ListAllSessions(this.sessionRepository);
  
  @override
  Future<Either<Failure, List<Session>>> call(NoParams params) async {
    return await sessionRepository.list();
  }
  
}