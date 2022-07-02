import 'package:dartz/dartz.dart';

import '../../../../core/models/exception.dart';
import '../../../../core/models/failure.dart';
import '../../domain/entities/grupo.dart';
import '../../domain/repositories/grupos_repository.dart';
import '../datasources/grupos_datasource.dart';

class GruposRepositoryImpl implements GruposRepository {
  final GruposDatasource datasource;

  GruposRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, List<Grupo>>> getGrupos({List<int>? ids}) async {
    try {
      return Right(await datasource.getGrupos(ids: ids));
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
