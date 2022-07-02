import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:vidado/core/models/exception.dart';
import 'package:vidado/features/faturamento/data/datasources/faturamento_datasource.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockHttpClient = Mock with http.Client;

class MockHttpServer extends Mock implements HttpServer {
  @override
  Uri get uri => super.noSuchMethod(Invocation.getter(#uri),
      returnValue: Uri.http('example.org', '/'));
}

void main() {
  late FaturamentoDatasource datasource;
  late MockHttpServer mockServer;
  late MockHttpClient mockHttpClient;
  late Uri uri;

  setUpAll(() {
    uri = Uri.parse('http://example.org/');
    mockServer = MockHttpServer();
    mockHttpClient = MockHttpClient();
    datasource = FaturamentoDatasourceImpl(
      mockHttpClient,
      uri: uri,
    );
  });

  group('getFaturamentoPorMes', () {
    test('should parse a valid response from the server', () async {
      when(
        mockHttpClient.post(
          mockServer.uri,
          headers: anyNamed('headers'),
          body: anyNamed('body'),
        ),
      ).thenAnswer((_) async => http.Response(
            fixture(
              path: 'faturamento',
              filename: 'get_faturamento_por_mes_response.xml',
            ),
            200,
          ));

      final result = await datasource.getFaturamentoPorMes(
        DateTime.now(),
        DateTime.now(),
        [],
      );

      expect(result, isNotEmpty);
    });

    test('should parse a valid fault message', () async {
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

      final call = datasource.getFaturamentoPorMes;

      expect(
        () => call(DateTime.now(), DateTime.now(), []),
        throwsA(isInstanceOf<ServerException>()),
      );
    });
  });

  group('getFaturamentoPorDia', () {
    test('should parse a valid response from the server', () async {
      when(
        mockHttpClient.post(
          mockServer.uri,
          headers: anyNamed('headers'),
          body: anyNamed('body'),
        ),
      ).thenAnswer((_) async => http.Response(
            fixture(
              path: 'faturamento',
              filename: 'get_faturamento_por_dia_response.xml',
            ),
            200,
          ));

      final result = await datasource.getFaturamentoPorDia(
        DateTime.now(),
        DateTime.now(),
        [],
      );

      expect(result, isNotEmpty);
    });

    test('should parse a valid fault message', () async {
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

      final call = datasource.getFaturamentoPorDia;

      expect(
        () => call(DateTime.now(), DateTime.now(), []),
        throwsA(isInstanceOf<ServerException>()),
      );
    });
  });

  group('getMaisVendidoPorGrupo', () {
    test('should parse a valid response from the server', () async {
      when(
        mockHttpClient.post(
          mockServer.uri,
          headers: anyNamed('headers'),
          body: anyNamed('body'),
        ),
      ).thenAnswer((_) async => http.Response(
            fixture(
              path: 'faturamento',
              filename: 'get_mais_vendido_por_grupo_response.xml',
            ),
            200,
          ));

      final result = await datasource.getMaisVendidoPorGrupo(
        DateTime.now(),
        DateTime.now(),
        [],
      );

      expect(result, isNotEmpty);
    });

    test('should parse a valid fault message', () async {
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

      final call = datasource.getMaisVendidoPorGrupo;

      expect(
        () => call(DateTime.now(), DateTime.now(), []),
        throwsA(isInstanceOf<ServerException>()),
      );
    });
  });

  group('getProdutoMaisVendido', () {
    test('should parse a valid response from the server', () async {
      when(
        mockHttpClient.post(
          mockServer.uri,
          headers: anyNamed('headers'),
          body: anyNamed('body'),
        ),
      ).thenAnswer((_) async => http.Response(
            fixture(
              path: 'faturamento',
              filename: 'get_produto_mais_vendido_response.xml',
            ),
            200,
          ));

      final result = await datasource.getProdutoMaisVendido(
        DateTime.now(),
        DateTime.now(),
        [],
      );

      expect(result, isNotEmpty);
    });

    test('should parse a valid fault message', () async {
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

      final call = datasource.getProdutoMaisVendido;

      expect(
        () => call(DateTime.now(), DateTime.now(), []),
        throwsA(isInstanceOf<ServerException>()),
      );
    });
  });

  group('getVendasPorHorario', () {
    test('should parse a valid response from the server', () async {
      when(
        mockHttpClient.post(
          mockServer.uri,
          headers: anyNamed('headers'),
          body: anyNamed('body'),
        ),
      ).thenAnswer((_) async => http.Response(
            fixture(
              path: 'faturamento',
              filename: 'get_vendas_por_horario_response.xml',
            ),
            200,
          ));

      final result = await datasource.getVendasPorHorario(
        DateTime.now(),
        DateTime.now(),
        [],
      );

      expect(result, isNotEmpty);
    });

    test('should parse a valid fault message', () async {
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

      final call = datasource.getVendasPorHorario;

      expect(
        () => call(DateTime.now(), DateTime.now(), []),
        throwsA(isInstanceOf<ServerException>()),
      );
    });
  });
}
