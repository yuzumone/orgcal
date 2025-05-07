import 'dart:convert' show utf8;
import 'package:http/http.dart' as http;
import 'package:http_retry/http_retry.dart';
import 'package:org_parser/org_parser.dart';
import 'package:orgcal/data/model/file.dart';

class FileRepository {
  late final RetryClient client;

  FileRepository() {
    client = RetryClient(
      http.Client(),
      retries: 5,
      when: (response) => response.statusCode > 299,
      whenError: (dynamic error, StackTrace stackTrace) {
        return true;
      },
    );
  }

  Future<File?> getWebFile(String url, List<String> keywords) async {
    var res = await client.get(Uri.parse(url));
    if (res.statusCode < 300) {
      var org = await loadOrg(utf8.decode(res.bodyBytes), keywords: keywords);
      return File(url, org);
    }
    return null;
  }

  Future<List<File>> getWebFiles(
    List<String> urls,
    List<String> keywords,
  ) async {
    var files = <File>[];
    for (var url in urls) {
      var res = await client.get(Uri.parse(url));
      if (res.statusCode < 300) {
        var org = await loadOrg(utf8.decode(res.bodyBytes), keywords: keywords);
        files.add(File(url, org));
      }
    }
    return files;
  }
}
