import 'dart:io';
import '../models/student.dart';
import '../models/professor.dart';

class UniversityFileSystem {
  final String studentFile = 'students.txt';
  final String professorFile = 'professors.txt';

  void addStudent(Student s) {
    File(studentFile).writeAsStringSync('${s.toString()}\n', mode: FileMode.append);
  }

  void addProfessor(Professor p) {
    File(professorFile).writeAsStringSync('${p.toString()}\n', mode: FileMode.append);
  }

  List<Student> getAllStudents() {
    if (!File(studentFile).existsSync()) return [];
    return File(studentFile).readAsLinesSync().map((line) => Student.fromString(line)).toList();
  }

  List<Professor> getAllProfessors() {
    if (!File(professorFile).existsSync()) return [];
    return File(professorFile).readAsLinesSync().map((line) => Professor.fromString(line)).toList();
  }

  void showAllStudents() {
    var list = getAllStudents();
    list.isEmpty ? print('No students found.') : list.forEach((s) => s.displayInfo());
  }

  void showAllProfessors() {
    var list = getAllProfessors();
    list.isEmpty ? print('No professors found.') : list.forEach((p) => p.displayInfo());
  }

  void removeStudentById(int id) {
    var list = getAllStudents();
    list.removeWhere((s) => s.id == id);
    File(studentFile).writeAsStringSync(list.map((s) => s.toString()).join('\n') + '\n');
  }

  void removeProfessorById(int id) {
    var list = getAllProfessors();
    list.removeWhere((p) => p.id == id);
    File(professorFile).writeAsStringSync(list.map((p) => p.toString()).join('\n') + '\n');
  }

  Student? findStudentById(int id) {
    return getAllStudents().firstWhere((s) => s.id == id, orElse: () => null);
  }

  Professor? findProfessorById(int id) {
    return getAllProfessors().firstWhere((p) => p.id == id, orElse: () => null);
  }
}
