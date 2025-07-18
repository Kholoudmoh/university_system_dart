import 'person.dart';

class Student extends Person {
  Student(String name, int id, List<String> courses) : super(name, id, courses);

  @override
  void displayInfo() {
    print('Student -> Name: $name, ID: $id, Courses: ${courses.join(", ")}');
  }

  @override
  String toString() {
    return '$name|$id|${courses.join(",")}';
  }

  static Student fromString(String line) {
    var parts = line.split('|');
    var name = parts[0];
    var id = int.parse(parts[1]);
    var courseList = parts.length > 2 && parts[2].isNotEmpty ? parts[2].split(',') : [];
    return Student(name, id, courseList);
  }
}
