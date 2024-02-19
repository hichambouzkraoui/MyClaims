import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';
import 'package:myclaims/core/error/failures.dart';
import 'package:myclaims/core/usecases/usecase.dart';
import 'package:myclaims/features/claims/domain/entities/service.dart';
import 'package:myclaims/features/claims/domain/entities/session.dart';
import 'package:myclaims/features/claims/domain/repositories/session_repository.dart';
import 'package:myclaims/features/claims/domain/usecases/get_session_by_id.dart';
class MockSessionReposiotry extends Mock implements SessionRepository {}
void main() {
  late GetSessionById usecase;
  late MockSessionReposiotry repository;
  setUp(() {
    repository = MockSessionReposiotry();
    usecase = GetSessionById(repository);
  });
  final tId = 1;
  final tService = Service(id:1,name: 'service',rate: 10.0);
  final tSession = 
  Session(
    id: tId, 
    expenseDate: DateTime.parse('2023-07-20'), 
    service: tService, 
    quantity: 2.5, 
    miscellaneous: 0, 
    total: 25, 
    comment: 'service'
  );
  test('should get session by id from repository', () async {
    //arrange
    when(() => repository.getById(any())).thenAnswer((_) async => Right(tSession));
    // act
    final result = await usecase(Params(id: tId));
    // assert
    verify(() => repository.getById(tId));
    expect(result, Right(tSession));
  });

  test('should return server failure  when repository returns server failure', () async {
    //arrange
    when(() => repository.getById(any())).thenAnswer((_) async => Left(ServerFailure()));
    // act
    final result = await usecase(Params(id: tId));
    // assert
    verify(() => repository.getById(tId));
    expect(result, Left(ServerFailure()));
  });

  test('should return cache failure  when repository returns cache failure', () async {
    //arrange
    when(() => repository.getById(any())).thenAnswer((_) async => Left(CacheFailure()));
    // act
    final result = await usecase(Params(id: tId));
    // assert
    verify(() => repository.getById(tId));
    expect(result, Left(CacheFailure()));
  });
}