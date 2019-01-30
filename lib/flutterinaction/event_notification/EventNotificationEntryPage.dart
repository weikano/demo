import 'package:demo/flutterinaction/basics.dart';

class EventNotificationEntryPage extends BaseSubEntryPage {
  @override
  String get iconUrl => null;

  @override
  String get routeName => "/event_notification";

  @override
  String get title => "事件处理与通知";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EventNotificationEntryPage && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;

  @override
  // TODO: implement url
  String get url => null;
}
