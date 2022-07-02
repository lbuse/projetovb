import 'package:mobx/mobx.dart';

import '../../domain/repositories/faturamento_repository.dart';
import '../../domain/usecases/get_faturamento_total_periodo.dart';

part 'faturamento_total_periodo_state.g.dart';

class FaturamentoTotalPeriodoState extends _FaturamentoTotalPeriodoState
    with _$FaturamentoTotalPeriodoState {
  FaturamentoTotalPeriodoState(FaturamentoRepository repository) {
    _repository = repository;
  }
}

abstract class _FaturamentoTotalPeriodoState with Store {
  late FaturamentoRepository _repository;

  @observable
  ObservableList<FaturamentoTotal> faturamentos =
      ObservableList<FaturamentoTotal>();
  @observable
  bool isLoading = false;
  @observable
  String errorMessage = '';

  @computed
  bool get hasData => faturamentos.isNotEmpty;

  @action
  void changeFaturamentos(List<FaturamentoTotal> list) =>
      faturamentos = ObservableList<FaturamentoTotal>.of(list);
  @action
  void changeIsLoading(bool value) => isLoading = value;
  @action
  void changeErrorMessage(String message) => errorMessage = message;

  Future<void> loadFaturamentoTotalPeriodo({
    required DateTime dataInicial,
    required DateTime dataFinal,
  }) async {
    changeIsLoading(true);
    final getFaturamentoTotalPeriodo = await GetFaturamentoTotalPeriodo(
      _repository,
    )(
      Params(
        dataInicial: dataInicial,
        dataFinal: dataFinal,
      ),
    );

    getFaturamentoTotalPeriodo.fold(
      (failure) => changeErrorMessage(failure.message),
      (faturamentos) => changeFaturamentos(faturamentos),
    );
    changeIsLoading(false);
  }
}
