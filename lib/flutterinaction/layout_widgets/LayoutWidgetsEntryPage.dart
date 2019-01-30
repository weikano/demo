import 'package:demo/flutterinaction/basics.dart';

class LayoutWidgetsEntryPage extends BaseSubEntryPage {
  @override
  String get iconUrl => null;

  @override
  String get routeName => "/layout_widgets";

  @override
  String get title => "布局类widgets";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LayoutWidgetsEntryPage && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;

  @override
  // TODO: implement url
  String get url => null;
}
