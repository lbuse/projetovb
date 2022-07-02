import 'package:dartz/dartz.dart';

import '../../../../core/models/failure.dart';
import '../entities/grupo.dart';

abstract class GruposRepository {
  Future<Either<Failure, List<Grupo>>> getGrupos({List<int>? ids});
}
