import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:vidado/core/models/exception.dart';
import 'package:vidado/features/cadastro/data/datasources/grupos_datasource.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockHttpClient = Mock with http.Client;

class MockHttpServer extends Mock implements HttpServer {
  @override
  Uri get uri => super.noSuchMethod(Invocation.getter(#uri),
      returnValue: Uri.http('example.org', '/'));
}

void main() {
  late GruposDatasource datasource;
  late MockHttpServer mockServer;
  late MockHttpClient mockHttpClient;
  late Uri uri;

  setUpAll(() {
    uri = Uri.parse('http://example.org/');
    mockServer = MockHttpServer();
    mockHttpClient = MockHttpClient();
    datasource = GruposDatasourceImpl(
      mockHttpClient,
      uri: uri,
    );
  });

  test('getGrupos should parse a valid response from the server', () async {
    when(
      mockHttpClient.post(
        mockServer.uri,
        headers: anyNamed('headers'),
        body: anyNamed('body'),
      ),
    ).thenAnswer((_) async => http.Response(
          fixture(
            path: 'cadastro',
            filename: 'get_grupos_response.xml',
          ),
          200,
        ));

    final result = await datasource.getGrupos();

    expect(result, isNotEmpty);
  });

  test('getGrupos should parse a valid fault message', () async {
    when(
      mockHttpClient.post(
        mockServer.uri,
        headers: anyNamed('headers'),
        body: anyNamed('body'),
      ),
    ).thenAnswer((_) async => http.Response(
          fixture(
            path: 'fault',
            filename: 'fault.xml',
          ),
          500,
        ));

    final call = datasource.getGrupos;

    expect(
      () => call(),
      throwsA(isInstanceOf<ServerException>()),
    );
  });
}
