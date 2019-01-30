import 'package:demo/flutterinaction/basics.dart';

class BasicWidgetsEntryPage extends BaseSubEntryPage {
  @override
  String get iconUrl => null;

  @override
  String get routeName => "basic_widgets";

  @override
  String get title => "基础widgets";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BasicWidgetsEntryPage && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;

  @override
  // TODO: implement url
  String get url => null;
}
