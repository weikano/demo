import 'package:demo/flutterinaction/basics.dart';

class CustomWidgetsEntryPage extends BaseSubEntryPage {
  @override
  String get iconUrl => null;

  @override
  String get routeName => "/custom_widgets";

  @override
  String get title => "自定义widgets";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustomWidgetsEntryPage && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;

  @override
  // TODO: implement url
  String get url => null;
}
