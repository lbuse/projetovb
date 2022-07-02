import 'package:dartz/dartz.dart';

import '../../../../core/models/exception.dart';
import '../../../../core/models/failure.dart';
import '../../domain/entities/faturamento_por_dia.dart';
import '../../domain/entities/faturamento_por_mes.dart';
import '../../domain/entities/mais_vendido_por_grupo.dart';
import '../../domain/entities/produto_mais_vendido.dart';
import '../../domain/entities/venda_por_horario.dart';
import '../../domain/repositories/faturamento_repository.dart';
import '../datasources/faturamento_datasource.dart';

class FaturamentoRepositoryImpl implements FaturamentoRepository {
  final FaturamentoDatasource datasource;

  FaturamentoRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, List<FaturamentoPorMes>>> getFaturamentoPorMes(
    DateTime dataInicial,
    DateTime dataFinal, {
    List<int>? lojas,
  }) async {
    try {
      return Right(await datasource.getFaturamentoPorMes(
        dataInicial,
        dataFinal,
        lojas,
      ));
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
  Future<Either<Failure, List<FaturamentoPorDia>>> getFaturamentoPorDia(
    DateTime dataInicial,
    DateTime dataFinal, {
    List<int>? lojas,
  }) async {
    try {
      return Right(await datasource.getFaturamentoPorDia(
        dataInicial,
        dataFinal,
        lojas,
      ));
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
  Future<Either<Failure, List<MaisVendidoPorGrupo>>> getMaisVendidoPorGrupos(
    DateTime dataInicial,
    DateTime dataFinal, {
    List<int>? lojas,
  }) async {
    try {
      return Right(await datasource.getMaisVendidoPorGrupo(
        dataInicial,
        dataFinal,
        lojas,
      ));
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
  Future<Either<Failure, List<ProdutoMaisVendido>>> getProdutoMaisVendido(
    DateTime dataInicial,
    DateTime dataFinal, {
    List<int>? lojas,
  }) async {
    try {
      return Right(await datasource.getProdutoMaisVendido(
        dataInicial,
        dataFinal,
        lojas,
      ));
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
  Future<Either<Failure, List<VendaPorHorario>>> getVendasPorHorario(
    DateTime dataInicial,
    DateTime dataFinal, {
    List<int>? lojas,
  }) async {
    try {
      return Right(await datasource.getVendasPorHorario(
        dataInicial,
        dataFinal,
        lojas,
      ));
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
