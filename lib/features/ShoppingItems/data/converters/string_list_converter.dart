import 'package:floor/floor.dart';

class StringListConverter extends TypeConverter<List<String>, String> {
  @override
  List<String> decode(String databaseValue) {
    return databaseValue.split(',').map((tag) => tag.trim()).toList();
  }

  @override
  String encode(List<String> value) {
    return value.join(',');
  }
}
