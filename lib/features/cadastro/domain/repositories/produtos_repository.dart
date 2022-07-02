import 'package:dartz/dartz.dart';

import '../../../../core/models/failure.dart';
import '../entities/produto.dart';

abstract class ProdutosRepository {
  Future<Either<Failure, List<Produto>>> getProdutos({List<int>? ids});
  Future<Either<Failure, List<Produto>>> getProdutosPorTermo(String termo);
}
