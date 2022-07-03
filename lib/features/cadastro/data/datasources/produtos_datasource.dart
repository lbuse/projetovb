import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../../../core/helpers/config.dart';
import '../../../../core/helpers/soap_response_envelope_parser.dart';
import '../../../../core/models/exception.dart';
import '../../domain/entities/produto.dart';
import '../models/produto_model.dart';

abstract class ProdutosDatasource {
  Future<List<Produto>> getProdutos({List<int>? ids});
  Future<List<Produto>> getProdutosPorTermo(String termo);
}

class ProdutosDatasourceImpl implements ProdutosDatasource {
  final http.Client httpClient;
  late Uri _uri;

  ProdutosDatasourceImpl(this.httpClient, {Uri? uri}) {
    _uri = uri ?? Uri.parse(Config.uri);
  }

  @override
  Future<List<Produto>> getProdutos({List<int>? ids}) async {
    String idsTag = '';
    if (ids != null && ids.isNotEmpty) {
      idsTag = '<ids>${ids.join(',')}</ids>';
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
        <get_produtos>
            $idsTag
        </get_produtos> 
    </SOAP-ENV:Body>
</SOAP-ENV:Envelope>''',
    );

    if (response.statusCode == HttpStatus.ok) {
      final String content =
          SoapResponseEnvelope.parseResult(response.body) ?? '[]';
      return List<Produto>.from(
          json.decode(content).map((obj) => ProdutoModel.fromJson(obj)));
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
  Future<List<Produto>> getProdutosPorTermo(String termo) async {
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
        <get_produtos_por_termo>
            <termo>$termo</termo>
        </get_produtos_por_termo> 
    </SOAP-ENV:Body>
</SOAP-ENV:Envelope>''',
    );

    if (response.statusCode == HttpStatus.ok) {
      final String content =
          SoapResponseEnvelope.parseResult(response.body) ?? '[]';
      return List<Produto>.from(
          json.decode(content).map((obj) => ProdutoModel.fromJson(obj)));
    } else {
      final String content = SoapResponseEnvelope.parseFault(response.body) ??
          'Erro não especificado pelo servidor';
      throw ServerException(
        statusCode: response.statusCode,
        message: content,
      );
    }
  }
}
