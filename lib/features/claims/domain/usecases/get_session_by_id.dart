import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:myclaims/core/error/failures.dart';
import 'package:myclaims/core/usecases/usecase.dart';

import '../entities/session.dart';
import '../repositories/session_repository.dart';

class GetSessionById implements UseCase<Session,Params> {
   SessionRepository sessionRepository;
   GetSessionById(this.sessionRepository);

  @override
  Future<Either<Failure, Session>> call(Params params) async {
    return await sessionRepository.getById(params.id);
  }
  
}

class Params extends Equatable {
  final int id;
  const Params ({ required this.id});
  
  @override
  List<Object?> get props => [id] ;
  
}