import 'package:xml/xml.dart';

class SoapResponseEnvelope {
  /// Obtém o conteúdo do envelope SOAP
  static String? parseResult(String response) {
    XmlDocument document = XmlDocument.parse(response);
    return document.findAllElements('tns:resultado').first.text;
  }

  /// Obtém a mensagem de erro retornado pelo webservice
  static String? parseFault(String response) {
    XmlDocument document = XmlDocument.parse(response);
    return document
        .findAllElements('soap:Reason')
        .first
        .firstElementChild
        ?.text;
  }
}
