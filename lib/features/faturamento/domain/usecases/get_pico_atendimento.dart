import 'package:collection/collection.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/models/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/faturamento_repository.dart';

class GetPicoAtendimento implements Usecase<List<PicoAtendimento>, Params> {
  final FaturamentoRepository repository;

  GetPicoAtendimento(this.repository);

  @override
  Future<Either<Failure, List<PicoAtendimento>>> call(Params params) async {
    var result = await repository.getVendasPorHorario(
      params.dataInicial,
      params.dataFinal,
      lojas: params.lojas,
    );

    return result.fold(
      (failure) => Left(failure),
      (data) {
        List<PicoAtendimento> pessoasAtendidasPorHorario = [];

        for (var faturamento in data) {
          DateTime horarioVenda = DateTime(
            faturamento.data.year,
            faturamento.data.month,
            faturamento.data.day,
            faturamento.data.hour,
          );
          PicoAtendimento? pico = pessoasAtendidasPorHorario.firstWhereOrNull(
            (e) => e.data.isAtSameMomentAs(horarioVenda),
          );

          if (pico == null) {
            pessoasAtendidasPorHorario.add(PicoAtendimento(
              horarioVenda,
              faturamento.pessoasAtentidas,
            ));
          } else {
            pico.pessoasAtendidas += faturamento.pessoasAtentidas;
          }
        }

        return Right(pessoasAtendidasPorHorario);
      },
    );
  }
}

class Params {
  final DateTime dataInicial;
  final DateTime dataFinal;
  final List<int>? lojas;

  Params({
    required this.dataInicial,
    required this.dataFinal,
    this.lojas,
  });
}

class PicoAtendimento {
  final DateTime data;
  int pessoasAtendidas;

  PicoAtendimento(this.data, this.pessoasAtendidas);
}
