import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../../panel/presentation/stores/panel_state.dart';
import '../../domain/entities/mais_vendido_por_grupo.dart';
import '../../domain/repositories/faturamento_repository.dart';
import '../../domain/usecases/get_grupos_mais_vendidos.dart';

part 'grupo_mais_vendido_state.g.dart';

class GrupoMaisVendidoState extends _GrupoMaisVendidoState
    with _$GrupoMaisVendidoState {
  GrupoMaisVendidoState(FaturamentoRepository repository) {
    _repository = repository;
  }
}

abstract class _GrupoMaisVendidoState with Store {
  late FaturamentoRepository _repository;
  final PanelState _panelState = GetIt.I.get<PanelState>();

  @observable
  ObservableList<MaisVendidoPorGrupo> gruposMaisVendido =
      ObservableList<MaisVendidoPorGrupo>();
  @observable
  bool isLoading = false;
  @observable
  String errorMessage = '';

  @computed
  bool get hasData => gruposMaisVendido.isNotEmpty;
  @computed
  String get chartTitle {
    String title = 'Participação dos Grupos no Faturamento ';
    if (_panelState.lojaSelecionada != null) {
      title += 'da ${_panelState.lojaSelecionada!.nome}';
    }

    return title;
  }

  @action
  void changeGruposMaisVendido(List<MaisVendidoPorGrupo> list) =>
      gruposMaisVendido = ObservableList<MaisVendidoPorGrupo>.of(list);
  @action
  void changeIsLoading(bool value) => isLoading = value;
  @action
  void changeErrorMessage(String message) => errorMessage = message;

  Future<void> loadGruposMaisVendido({
    required DateTime dataInicial,
    required DateTime dataFinal,
    required int idLoja,
  }) async {
    changeIsLoading(true);
    final getGruposMaisVendidos = await GetGruposMaisVendidos(_repository)(
      Params(
        dataInicial: dataInicial,
        dataFinal: dataFinal,
        idLoja: idLoja,
      ),
    );
    getGruposMaisVendidos.fold(
      (failure) => changeErrorMessage(failure.message),
      (grupos) => changeGruposMaisVendido(grupos),
    );
    changeIsLoading(false);
  }
}
