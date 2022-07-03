import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../../../core/helpers/config.dart';
import '../../../../core/helpers/soap_response_envelope_parser.dart';
import '../../../../core/models/exception.dart';
import '../../domain/entities/grupo.dart';
import '../models/grupo_model.dart';

abstract class GruposDatasource {
  Future<List<Grupo>> getGrupos({List<int>? ids});
}

class GruposDatasourceImpl implements GruposDatasource {
  final http.Client httpClient;
  late Uri _uri;

  GruposDatasourceImpl(this.httpClient, {Uri? uri}) {
    _uri = uri ?? Uri.parse(Config.uri);
  }

  @override
  Future<List<Grupo>> getGrupos({List<int>? ids}) async {
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
        <get_grupos>
            $idsTag
        </get_grupos> 
    </SOAP-ENV:Body>
</SOAP-ENV:Envelope>''',
    );

    if (response.statusCode == HttpStatus.ok) {
      final String content =
          SoapResponseEnvelope.parseResult(response.body) ?? '[]';
      return List<Grupo>.from(
          json.decode(content).map((obj) => GrupoModel.fromJson(obj)));
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
