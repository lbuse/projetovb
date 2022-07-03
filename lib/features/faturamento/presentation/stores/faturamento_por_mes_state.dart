import 'package:mobx/mobx.dart';

import '../../domain/entities/faturamento_por_mes.dart';
import '../../domain/repositories/faturamento_repository.dart';
import '../../domain/usecases/get_faturamento_por_mes.dart';

part 'faturamento_por_mes_state.g.dart';

class FaturamentoPorMesState extends _FaturamentoPorMesState
    with _$FaturamentoPorMesState {
  FaturamentoPorMesState(FaturamentoRepository repository) {
    _repository = repository;
  }
}

abstract class _FaturamentoPorMesState with Store {
  late FaturamentoRepository _repository;

  @observable
  ObservableMap<String, List<FaturamentoPorMes>> faturamentoPorMes =
      ObservableMap<String, List<FaturamentoPorMes>>();
  @observable
  bool isLoading = false;
  @observable
  String errorMessage = '';

  @computed
  bool get hasData => faturamentoPorMes.isNotEmpty;

  @action
  void changeFaturamentoPorMes(Map<String, List<FaturamentoPorMes>> map) =>
      faturamentoPorMes =
          ObservableMap<String, List<FaturamentoPorMes>>.of(map);
  @action
  void changeIsLoading(bool value) => isLoading = value;
  @action
  void changeErrorMessage(String message) => errorMessage = message;

  Future<void> loadFaturamentoPorMes({
    required DateTime dataInicial,
    required DateTime dataFinal,
  }) async {
    ///
    /// [Inndica para a interface que a animação de carregamento deve ser exibida]
    ///
    changeIsLoading(true);

    ///
    /// [Executa o caso de uso que consulta o faturamento por mês]
    ///
    final getFaturamentoPorMes = await GetFaturamentoPorMes(_repository)(
      Params(
        dataInicial: dataInicial,
        dataFinal: dataFinal,
      ),
    );

    ///
    /// [Assim que a consulta retornar, os valores serão utilizados nessa MVVM]
    ///
    getFaturamentoPorMes.fold(
      (failure) => changeErrorMessage(failure.message),
      (faturamentos) => changeFaturamentoPorMes(faturamentos),
    );

    ///
    /// [Inndica para a interface que a animação de carregamento deve ser finalizada]
    ///
    changeIsLoading(false);
  }
}
