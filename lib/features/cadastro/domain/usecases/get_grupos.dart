import 'package:dartz/dartz.dart';

import '../../../../core/models/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/grupo.dart';
import '../repositories/grupos_repository.dart';

class GetGrupos implements Usecase<List<Grupo>, Params> {
  final GruposRepository repository;

  GetGrupos(this.repository);

  @override
  Future<Either<Failure, List<Grupo>>> call(Params params) {
    return repository.getGrupos(ids: params.ids);
  }
}

class Params {
  final List<int> ids;

  Params(this.ids);
}
