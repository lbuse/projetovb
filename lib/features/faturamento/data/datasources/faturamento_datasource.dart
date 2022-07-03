import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../../../core/helpers/config.dart';
import '../../../../core/helpers/soap_response_envelope_parser.dart';
import '../../../../core/models/exception.dart';
import '../../domain/entities/faturamento_por_dia.dart';
import '../../domain/entities/faturamento_por_mes.dart';
import '../../domain/entities/mais_vendido_por_grupo.dart';
import '../../domain/entities/produto_mais_vendido.dart';
import '../../domain/entities/venda_por_horario.dart';
import '../models/faturamento_por_dia_model.dart';
import '../models/faturamento_por_mes_model.dart';
import '../models/mais_vendido_por_grupo_model.dart';
import '../models/produto_mais_vendido_model.dart';
import '../models/venda_por_horario_model.dart';

abstract class FaturamentoDatasource {
  Future<List<FaturamentoPorMes>> getFaturamentoPorMes(
    DateTime dataInicial,
    DateTime dataFinal,
    List<int>? lojas,
  );

  Future<List<FaturamentoPorDia>> getFaturamentoPorDia(
    DateTime dataInicial,
    DateTime dataFinal,
    List<int>? lojas,
  );

  Future<List<MaisVendidoPorGrupo>> getMaisVendidoPorGrupo(
    DateTime dataInicial,
    DateTime dataFinal,
    List<int>? lojas,
  );

  Future<List<ProdutoMaisVendido>> getProdutoMaisVendido(
    DateTime dataInicial,
    DateTime dataFinal,
    List<int>? lojas,
  );

  Future<List<VendaPorHorario>> getVendasPorHorario(
    DateTime dataInicial,
    DateTime dataFinal,
    List<int>? lojas,
  );
}

class FaturamentoDatasourceImpl implements FaturamentoDatasource {
  final http.Client httpClient;
  late Uri _uri;

  FaturamentoDatasourceImpl(this.httpClient, {Uri? uri}) {
    _uri = uri ?? Uri.parse(Config.uri);
  }

  @override
  Future<List<FaturamentoPorMes>> getFaturamentoPorMes(
    DateTime dataInicial,
    DateTime dataFinal,
    List<int>? lojas,
  ) async {
    String nodoLojas = '';
    if (lojas != null && lojas.isNotEmpty) {
      nodoLojas = '<lojas>${lojas.join(',')}</lojas>';
    }

    final response = await httpClient.post(
      _uri,
      headers: {
        'Accept': '*/*',
        'User-Agent': 'Vidado Client',
        'Content-Type': 'application/xml'
      },
      body: '''<?xml version="1.0" encoding="UTF-8"?>
<SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/">
    <SOAP-ENV:Body>
        <get_faturamento_por_mes>
            <data_inicial>${dataInicial.toIso8601String()}</data_inicial>
            <data_final>${dataFinal.toIso8601String()}</data_final>
            $nodoLojas
        </get_faturamento_por_mes> 
     </SOAP-ENV:Body>
</SOAP-ENV:Envelope>''',
    );

    if (response.statusCode == HttpStatus.ok) {
      final String content =
          SoapResponseEnvelope.parseResult(response.body) ?? '[]';
      return List<FaturamentoPorMes>.from(json
          .decode(content)
          .map((obj) => FaturamentoPorMesModel.fromJson(obj)));
    } else {
      final String content = SoapResponseEnvelope.parseFault(response.body) ??
          'Erro não especificado pelo servidor';
      throw ServerException(
        statusCode: response.statusCode,
        message: content,
      );
    }
  }

  @override
  Future<List<FaturamentoPorDia>> getFaturamentoPorDia(
    DateTime dataInicial,
    DateTime dataFinal,
    List<int>? lojas,
  ) async {
    String nodoLojas = '';
    if (lojas != null && lojas.isNotEmpty) {
      nodoLojas = '<lojas>${lojas.join(',')}</lojas>';
    }

    final response = await httpClient.post(
      _uri,
      headers: {
        'Accept': '*/*',
        'User-Agent': 'Vidado Client',
        'Content-Type': 'application/xml'
      },
      body: '''<?xml version="1.0" encoding="UTF-8"?>
<SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/">
    <SOAP-ENV:Body>
        <get_faturamento_por_dia>
            <data_inicial>${dataInicial.toIso8601String()}</data_inicial>
            <data_final>${dataFinal.toIso8601String()}</data_final>
            $nodoLojas
        </get_faturamento_por_dia> 
     </SOAP-ENV:Body>
</SOAP-ENV:Envelope>''',
    );

    if (response.statusCode == HttpStatus.ok) {
      final String content =
          SoapResponseEnvelope.parseResult(response.body) ?? '[]';
      return List<FaturamentoPorDia>.from(json
          .decode(content)
          .map((obj) => FaturamentoPorDiaModel.fromJson(obj)));
    } else {
      final String content = SoapResponseEnvelope.parseFault(response.body) ??
          'Erro não especificado pelo servidor';
      throw ServerException(
        statusCode: response.statusCode,
        message: content,
      );
    }
  }

  @override
  Future<List<MaisVendidoPorGrupo>> getMaisVendidoPorGrupo(
    DateTime dataInicial,
    DateTime dataFinal,
    List<int>? lojas,
  ) async {
    String nodoLojas = '';
    if (lojas != null && lojas.isNotEmpty) {
      nodoLojas = '<lojas>${lojas.join(',')}</lojas>';
    }

    final response = await httpClient.post(
      _uri,
      headers: {
        'Accept': '*/*',
        'User-Agent': 'Vidado Client',
        'Content-Type': 'application/xml'
      },
      body: '''<?xml version="1.0" encoding="UTF-8"?>
<SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/">
    <SOAP-ENV:Body>
        <get_mais_vendidos_por_grupo>
            <data_inicial>${dataInicial.toIso8601String()}</data_inicial>
            <data_final>${dataFinal.toIso8601String()}</data_final>
            $nodoLojas
        </get_mais_vendidos_por_grupo> 
     </SOAP-ENV:Body>
</SOAP-ENV:Envelope>''',
    );

    if (response.statusCode == HttpStatus.ok) {
      final String content =
          SoapResponseEnvelope.parseResult(response.body) ?? '[]';
      return List<MaisVendidoPorGrupoModel>.from(json
          .decode(content)
          .map((obj) => MaisVendidoPorGrupoModel.fromJson(obj)));
    } else {
      final String content = SoapResponseEnvelope.parseFault(response.body) ??
          'Erro não esepcificado pelo servidor';
      throw ServerException(
        statusCode: response.statusCode,
        message: content,
      );
    }
  }

  @override
  Future<List<ProdutoMaisVendido>> getProdutoMaisVendido(
    DateTime dataInicial,
    DateTime dataFinal,
    List<int>? lojas,
  ) async {
    String nodoLojas = '';
    if (lojas != null && lojas.isNotEmpty) {
      nodoLojas = '<lojas>${lojas.join(',')}</lojas>';
    }

    final response = await httpClient.post(
      _uri,
      headers: {
        'Accept': '*/*',
        'User-Agent': 'Vidado Client',
        'Content-Type': 'application/xml'
      },
      body: '''<?xml version="1.0" encoding="UTF-8"?>
<SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/">
    <SOAP-ENV:Body>
        <get_produto_mais_vendido>
            <data_inicial>${dataInicial.toIso8601String()}</data_inicial>
            <data_final>${dataInicial.toIso8601String()}</data_final>
            $nodoLojas
        </get_produto_mais_vendido> 
     </SOAP-ENV:Body>
</SOAP-ENV:Envelope>''',
    );

    if (response.statusCode == HttpStatus.ok) {
      final String content =
          SoapResponseEnvelope.parseResult(response.body) ?? '[]';
      return List<ProdutoMaisVendido>.from(json
          .decode(content)
          .map((obj) => ProdutoMaisVendidoModel.fromJson(obj)));
    } else {
      final String content = SoapResponseEnvelope.parseFault(response.body) ??
          'Erro não esepcificado pelo servidor';
      throw ServerException(
        statusCode: response.statusCode,
        message: content,
      );
    }
  }

  @override
  Future<List<VendaPorHorario>> getVendasPorHorario(
    DateTime dataInicial,
    DateTime dataFinal,
    List<int>? lojas,
  ) async {
    String nodoLojas = '';
    if (lojas != null && lojas.isNotEmpty) {
      nodoLojas = '<lojas>${lojas.join(',')}</lojas>';
    }

    final response = await httpClient.post(
      _uri,
      headers: {
        'Accept': '*/*',
        'User-Agent': 'Vidado Client',
        'Content-Type': 'application/xml'
      },
      body: '''<?xml version="1.0" encoding="UTF-8"?>
<SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/">
    <SOAP-ENV:Body>
        <get_vendas_por_horario>
            <data_inicial>${dataInicial.toIso8601String()}</data_inicial>
            <data_final>${dataFinal.toIso8601String()}</data_final>
            $nodoLojas
        </get_vendas_por_horario> 
     </SOAP-ENV:Body>
</SOAP-ENV:Envelope>''',
    );

    if (response.statusCode == HttpStatus.ok) {
      final String content =
          SoapResponseEnvelope.parseResult(response.body) ?? '[]';
      return List<VendaPorHorario>.from(json
          .decode(content)
          .map((obj) => VendaPorHorarioModel.fromJson(obj)));
    } else {
      final String content = SoapResponseEnvelope.parseFault(response.body) ??
          'Erro não esepcificado pelo servidor';
      throw ServerException(
        statusCode: response.statusCode,
        message: content,
      );
    }
  }
}
