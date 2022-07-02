import 'package:dartz/dartz.dart';

import '../../../../core/models/exception.dart';
import '../../../../core/models/failure.dart';
import '../../domain/entities/loja.dart';
import '../../domain/repositories/lojas_repository.dart';
import '../datasources/lojas_datasource.dart';

class LojasRepositoryImpl implements LojasRepository {
  final LojasDatasource datasource;

  LojasRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, List<Loja>>> getLojas({List<int>? ids}) async {
    try {
      return Right(await datasource.getLojas(ids: ids));
    } on ServerException catch (e) {
      return Left(ServerFailure(
        statusCode: e.statusCode,
        message: e.message,
      ));
    } on Exception catch (e) {
      return Left(GeneralFailure(
        message: e.toString(),
      ));
    }
  }
}
