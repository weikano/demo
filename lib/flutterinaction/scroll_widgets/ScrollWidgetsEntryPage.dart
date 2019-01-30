import 'package:demo/flutterinaction/basics.dart';

class ScrollWidgetsEntryPage extends BaseSubEntryPage {
  @override
  String get iconUrl => null;

  @override
  String get routeName => "/scroll_widgets";

  @override
  String get title => "可滚动widgets";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ScrollWidgetsEntryPage && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;

  @override
  // TODO: implement url
  String get url => null;
}
