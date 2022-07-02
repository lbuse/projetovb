import 'package:dartz/dartz.dart';

import '../../../../core/models/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/loja.dart';
import '../repositories/lojas_repository.dart';

class GetLojas implements Usecase<List<Loja>, Params> {
  final LojasRepository repository;

  GetLojas(this.repository);

  @override
  Future<Either<Failure, List<Loja>>> call(Params params) async {
    return await repository.getLojas(ids: params.ids);
  }
}

class Params {
  final List<int>? ids;

  Params({this.ids});
}
