import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';

import '../../../cadastro/data/datasources/lojas_datasource.dart';
import '../../../cadastro/data/repositories/lojas_repository_impl.dart';
import '../../../cadastro/domain/entities/loja.dart';
import '../../../faturamento/presentation/widgets/indicador_faturamento_por_mes.dart';
import '../../../faturamento/presentation/widgets/indicador_faturamento_total_periodo.dart';
import '../../../faturamento/presentation/widgets/indicador_grupo_mais_vendido.dart';
import '../../../faturamento/presentation/widgets/indicador_pico_atendimento.dart';
import '../stores/panel_state.dart';

class PanelPage extends StatefulWidget {
  const PanelPage({Key? key}) : super(key: key);

  @override
  State<PanelPage> createState() => _PanelPageState();
}

class _PanelPageState extends State<PanelPage> {
  final TextEditingController dataInicialEditingController =
      TextEditingController();
  final TextEditingController dataFinalEditingController =
      TextEditingController();
  final PanelState state = PanelState(
    LojasRepositoryImpl(
      LojasDatasourceImpl(http.Client()),
    ),
  );
  final List<ReactionDisposer> _disposers = [];

  @override
  void initState() {
    super.initState();
    GetIt.I.registerSingleton<PanelState>(state);

    when(
      (_) => state.lojas.isNotEmpty,
      () => state.changeLojaSelecionada(state.lojas.first),
    );

    when(
      (_) => state.isFormValid,
      () => state.changeWasSubmitted(true),
    );

    if (_disposers.isEmpty) {
      _disposers.addAll([
        reaction<String>(
          (_) => state.errorMessage,
          (message) {
            if (message.isNotEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(message),
              ));
            }
          },
        ),
      ]);
    }

    dataInicialEditingController.value = TextEditingValue(
      text: state.dataInicialFormatada,
    );
    dataFinalEditingController.value = TextEditingValue(
      text: state.dataFinalFormatada,
    );
    state.loadLojas();

    Future.delayed(const Duration(milliseconds: 500), () {
      state.changeLastDateFieldsChange();
    });
  }

  @override
  void dispose() {
    for (ReactionDisposer dispose in _disposers) {
      dispose();
    }
    dataInicialEditingController.dispose();
    dataFinalEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const SizedBox(
          height: kToolbarHeight,
          child: Image(
            image: AssetImage('assets/images/logo.png'),
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
      body: LayoutBuilder(builder: (_, constraints) {
        return Stack(
          children: [
            Observer(
              builder: (_) => Positioned(
                left: 0,
                top: 0,
                right: 0,
                child: state.isLoading
                    ? const LinearProgressIndicator()
                    : const SizedBox(height: 4),
              ),
            ),
            Positioned(
              left: 0,
              top: 16,
              right: 0,
              child: _buildPanelForm(),
            ),
            Positioned(
              left: 0,
              top: 92,
              right: 0,
              bottom: 0,
              child: _buildChartsPanel(constraints),
            ),
          ],
        );
      }),
    );
  }

  Widget _buildPanelForm() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 180,
                  child: Observer(
                    builder: (_) => TextFormField(
                      controller: dataInicialEditingController,
                      readOnly: true,
                      decoration: const InputDecoration(
                          labelText: 'Período Inicial',
                          suffixIcon: Icon(Icons.calendar_today_outlined),
                          border: OutlineInputBorder(),
                          isDense: true,
                          errorMaxLines: 2),
                      onTap: state.isLoading
                          ? null
                          : () => _selectDate(
                                currentDate: state.dataInicial,
                              ).then((picked) {
                                state.changeDataInicial(picked);
                                dataInicialEditingController.text =
                                    state.dataInicialFormatada;
                              }),
                      autovalidateMode: state.wasSubmitted
                          ? AutovalidateMode.onUserInteraction
                          : AutovalidateMode.disabled,
                      validator: (_) => state.isDataInicialValid
                          ? null
                          : 'Data inicial deve ser menor que data final',
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                SizedBox(
                  width: 180,
                  child: Observer(
                    builder: (_) => TextFormField(
                      controller: dataFinalEditingController,
                      readOnly: true,
                      decoration: const InputDecoration(
                          isDense: true,
                          labelText: 'Período Final',
                          suffixIcon: Icon(Icons.calendar_today_outlined),
                          border: OutlineInputBorder(),
                          errorMaxLines: 2),
                      onTap: state.isLoading
                          ? null
                          : () => _selectDate(
                                currentDate: state.dataFinal,
                              ).then((picked) {
                                state.changeDataFinal(picked);
                                dataFinalEditingController.text =
                                    state.dataFinalFormatada;
                              }),
                      autovalidateMode: state.wasSubmitted
                          ? AutovalidateMode.onUserInteraction
                          : AutovalidateMode.disabled,
                      validator: (_) => state.isDataFinalValid
                          ? null
                          : 'Data final deve ser maior que data inicial',
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                SizedBox(
                  width: 150,
                  child: Observer(
                    builder: (context) => DropdownButtonFormField<Loja>(
                      value: state.lojaSelecionada,
                      isDense: true,
                      isExpanded: true,
                      decoration: const InputDecoration(
                        isDense: true,
                        labelText: 'Loja',
                        border: OutlineInputBorder(),
                        errorMaxLines: 2,
                      ),
                      onChanged: state.isLoading
                          ? null
                          : (Loja? newValue) =>
                              state.changeLojaSelecionada(newValue),
                      items: state.lojas
                          .map<DropdownMenuItem<Loja>>(
                              (Loja loja) => DropdownMenuItem<Loja>(
                                    value: loja,
                                    child: Text(loja.nome),
                                  ))
                          .toList(),
                      autovalidateMode: state.wasSubmitted
                          ? AutovalidateMode.onUserInteraction
                          : AutovalidateMode.disabled,
                      validator: (_) => state.isLojaSelecionadaValid
                          ? null
                          : 'Uma loja deve ser selecionada',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChartsPanel(BoxConstraints constraints) {
    return Scrollbar(
      thumbVisibility: kIsWeb,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              StaggeredGrid.count(
                crossAxisCount: 4,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                children: [
                  StaggeredGridTile.count(
                    crossAxisCellCount: 4,
                    mainAxisCellCount: constraints.maxWidth < 1000 ? 2 : 1,
                    child: const IndicadorFaturamentoPorMes(),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: constraints.maxWidth < 1200 ? 4 : 2,
                    mainAxisCellCount: constraints.maxWidth < 1000 ? 2 : 1,
                    child: const IndicadorFaturamentoTotalPeriodo(),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: constraints.maxWidth < 1200 ? 4 : 2,
                    mainAxisCellCount: constraints.maxWidth < 1000 ? 2 : 1,
                    child: const IndicadorGrupoMaisVendido(),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 4,
                    mainAxisCellCount: constraints.maxWidth < 1000 ? 2 : 1,
                    child: const IndicadorPicoAtendimento(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<DateTime?> _selectDate({DateTime? currentDate}) async {
    return await showDatePicker(
      context: context,
      initialDate: currentDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2023, 12, 31),
    );
  }
}
