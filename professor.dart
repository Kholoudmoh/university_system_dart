import 'person.dart';

class Professor extends Person {
  Professor(String name, int id, List<String> courses) : super(name, id, courses);

  @override
  void displayInfo() {
    print('Professor -> Name: $name, ID: $id, Courses: ${courses.join(", ")}');
  }

  @override
  String toString() {
    return '$name|$id|${courses.join(",")}';
  }

  static Professor fromString(String line) {
    var parts = line.split('|');
    var name = parts[0];
    var id = int.parse(parts[1]);
    var courseList = parts.length > 2 && parts[2].isNotEmpty ? parts[2].split(',') : [];
    return Professor(name, id, courseList);
  }
}
