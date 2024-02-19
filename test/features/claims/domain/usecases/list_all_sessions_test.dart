import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';
import 'package:myclaims/core/error/failures.dart';
import 'package:myclaims/core/usecases/usecase.dart';
import 'package:myclaims/features/claims/domain/entities/service.dart';
import 'package:myclaims/features/claims/domain/entities/session.dart';
import 'package:myclaims/features/claims/domain/repositories/session_repository.dart';
import 'package:myclaims/features/claims/domain/usecases/list_all_sessions.dart';
class MockSessionReposiotry extends Mock implements SessionRepository {}
void main() {
  late ListAllSessions usecase;
  late MockSessionReposiotry repository;
  setUp(() {
    repository = MockSessionReposiotry();
    usecase = ListAllSessions(repository);
  });
  final tRespite = Service(id:1,name: 'Respite',rate: 10.0);
  final tAide = Service(id:2,name: 'Aide',rate: 11.0);
  final tSessions = [
    Session(id: 1, expenseDate: DateTime.parse('2023-07-20'), service: tRespite, quantity: 2.5, miscellaneous: 0, total: 25, comment: 'respite'),
    Session(id: 1, expenseDate: DateTime.parse('2023-07-21'), service: tRespite, quantity: 2, miscellaneous: 10.50, total: 125.5, comment: 'aide'),
  ];
  test('should list all sessions from repository', () async {
    //arrange
    when(() => repository.list()).thenAnswer((_) async => Right(tSessions));
    // act
    final result = await usecase(NoParams());
    // assert
    verify(() => repository.list());
    expect(result, Right(tSessions));
  });
  
  test('should return server failure  when repository returns server failure ', () async {
    //arrange
    when(() => repository.list()).thenAnswer((_) async => Left(ServerFailure()));
    // act
    final result = await usecase(NoParams());
    // assert
    verify(() => repository.list());
    expect(result, Left(ServerFailure()));
  });

  test('should return cache failure  when repository returns cahce failure ', () async {
    //arrange
    when(() => repository.list()).thenAnswer((_) async => Left(CacheFailure()));
    // act
    final result = await usecase(NoParams());
    // assert
    verify(() => repository.list());
    expect(result, Left(CacheFailure()));
  });
}