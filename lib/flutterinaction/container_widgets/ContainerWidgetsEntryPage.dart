import 'package:demo/flutterinaction/basics.dart';

class ContainerWidgetsEntryPage extends BaseSubEntryPage {
  @override
  String get iconUrl => null;

  @override
  String get routeName => "/container_widgets";

  @override
  String get title => "容器类widgets";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ContainerWidgetsEntryPage && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;

  @override
  String get url => "https://book.flutterchina.club/chapter5/";
}
