import 'package:demo/flutterinaction/basics.dart';

class FileNetworkEntryPage extends BaseSubEntryPage {
  @override
  String get iconUrl => null;

  @override
  String get routeName => "/file_network";

  @override
  String get title => "文件操作与网络请求";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FileNetworkEntryPage && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;

  @override
  // TODO: implement url
  String get url => null;
}
