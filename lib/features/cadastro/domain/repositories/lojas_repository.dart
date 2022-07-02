import 'package:dartz/dartz.dart';

import '../../../../core/models/failure.dart';
import '../entities/loja.dart';

abstract class LojasRepository {
  Future<Either<Failure, List<Loja>>> getLojas({List<int>? ids});
}
