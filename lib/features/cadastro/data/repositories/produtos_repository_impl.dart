import 'package:dartz/dartz.dart';

import '../../../../core/models/exception.dart';
import '../../../../core/models/failure.dart';
import '../../domain/entities/produto.dart';
import '../../domain/repositories/produtos_repository.dart';
import '../datasources/produtos_datasource.dart';

class ProdutosRepositoryImpl implements ProdutosRepository {
  final ProdutosDatasource datasource;

  ProdutosRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, List<Produto>>> getProdutos({List<int>? ids}) async {
    try {
      return Right(await datasource.getProdutos(ids: ids));
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

  @override
  Future<Either<Failure, List<Produto>>> getProdutosPorTermo(
    String termo,
  ) async {
    try {
      return Right(await datasource.getProdutosPorTermo(termo));
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
