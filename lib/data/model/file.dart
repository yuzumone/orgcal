import 'package:org_parser/org_parser.dart';

class File {
  String url;
  OrgFile org;

  File(this.url, this.org);

  String get name {
    var regex = RegExp(r'^.*/(.*?)(\?.+)?$');
    var firstMatch = regex.firstMatch(url);
    return firstMatch != null ? firstMatch.group(1)! : url;
  }
}
