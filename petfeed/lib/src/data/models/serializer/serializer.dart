library serializer;

import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:petfeed/src/data/models/local_status/local_status.dart';

part 'serializer.g.dart';

@SerializersFor(const [
  LocalStatus,
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
