import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../core/widgets/chart_container.dart';
import '../../../panel/presentation/stores/panel_state.dart';
import '../../data/datasources/faturamento_datasource.dart';
import '../../data/repositories/faturamento_repository_impl.dart';
import '../../domain/entities/mais_vendido_por_grupo.dart';
import '../stores/grupo_mais_vendido_state.dart';

class IndicadorGrupoMaisVendido extends StatefulWidget {
  const IndicadorGrupoMaisVendido({Key? key}) : super(key: key);

  @override
  State<IndicadorGrupoMaisVendido> createState() =>
      _IndicadorGrupoMaisVendidoState();
}

class _IndicadorGrupoMaisVendidoState extends State<IndicadorGrupoMaisVendido> {
  final GrupoMaisVendidoState _state = GrupoMaisVendidoState(
    FaturamentoRepositoryImpl(
      FaturamentoDatasourceImpl(http.Client()),
    ),
  );
  final List<ReactionDisposer> _disposers = [];
  final PanelState _panelState = GetIt.I.get<PanelState>();

  @override
  void initState() {
    super.initState();
    if (_disposers.isEmpty) {
      _disposers.addAll([
        reaction<DateTime>(
          (_) => _panelState.lastDateFieldsChange,
          (_) {
            if (_panelState.isFormValid) {
              _state.loadGruposMaisVendido(
                dataInicial: _panelState.dataInicial,
                dataFinal: _panelState.dataFinal,
                idLoja: _panelState.lojaSelecionada!.id,
              );
            }
          },
        ),
        reaction<DateTime>(
          (_) => _panelState.lastLojasChange,
          (_) {
            if (_panelState.isFormValid) {
              _state.loadGruposMaisVendido(
                dataInicial: _panelState.dataInicial,
                dataFinal: _panelState.dataFinal,
                idLoja: _panelState.lojaSelecionada!.id,
              );
            }
          },
        ),
      ]);
    }
  }

  @override
  void dispose() {
    for (ReactionDisposer dispose in _disposers) {
      dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => ChartContainer(
        chartTitle: _state.chartTitle,
        isLoading: _state.isLoading,
        hasData: _state.hasData,
        chart: SfCircularChart(
          title: ChartTitle(text: _state.chartTitle),
          legend: Legend(isVisible: true),
          tooltipBehavior: TooltipBehavior(
            enable: true,
            decimalPlaces: 2,
            format: 'point.y%',
          ),
          series: <CircularSeries>[
            PieSeries<MaisVendidoPorGrupo, String>(
              dataSource: _state.gruposMaisVendido,
              xValueMapper: (MaisVendidoPorGrupo data, _) => data.grupo,
              yValueMapper: (MaisVendidoPorGrupo data, _) =>
                  data.percentualLegivel,
            )
          ],
        ),
        errorMessage: _state.errorMessage,
        onRetry: () => _state.loadGruposMaisVendido(
          dataInicial: _panelState.dataInicial,
          dataFinal: _panelState.dataFinal,
          idLoja: _panelState.lojaSelecionada!.id,
        ),
      ),
    );
  }
}
