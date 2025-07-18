import 'dart:io';
import '../lib/services/university_file_system.dart';
import '../lib/models/student.dart';
import '../lib/models/professor.dart';

void showMenu() {
  print('\n=== University System ===');
  print('1. Add Student');
  print('2. Add Professor');
  print('3. Show All Students');
  print('4. Show All Professors');
  print('5. Find Student By ID');
  print('6. Find Professor By ID');
  print('7. Remove Student By ID');
  print('8. Remove Professor By ID');
  print('0. Exit');
  stdout.write('Choose: ');
}

void main() {
  var university = UniversityFileSystem();
  int? choice;

  do {
    showMenu();
    choice = int.tryParse(stdin.readLineSync() ?? '');

    switch (choice) {
      case 1:
        stdout.write('Student name: ');
        String name = stdin.readLineSync() ?? '';
        stdout.write('Student ID: ');
        int id = int.parse(stdin.readLineSync() ?? '');
        stdout.write('Courses (comma separated): ');
        List<String> courses = (stdin.readLineSync() ?? '').split(',');
        university.addStudent(Student(name, id, courses));
        break;

      case 2:
        stdout.write('Professor name: ');
        String name = stdin.readLineSync() ?? '';
        stdout.write('Professor ID: ');
        int id = int.parse(stdin.readLineSync() ?? '');
        stdout.write('Courses (comma separated): ');
        List<String> courses = (stdin.readLineSync() ?? '').split(',');
        university.addProfessor(Professor(name, id, courses));
        break;

      case 3:
        university.showAllStudents();
        break;

      case 4:
        university.showAllProfessors();
        break;

      case 5:
        stdout.write('Student ID: ');
        int id = int.parse(stdin.readLineSync() ?? '');
        var s = university.findStudentById(id);
        s != null ? s.displayInfo() : print('Student not found.');
        break;

      case 6:
        stdout.write('Professor ID: ');
        int id = int.parse(stdin.readLineSync() ?? '');
        var p = university.findProfessorById(id);
        p != null ? p.displayInfo() : print('Professor not found.');
        break;

      case 7:
        stdout.write('Student ID to remove: ');
        int id = int.parse(stdin.readLineSync() ?? '');
        university.removeStudentById(id);
        break;

      case 8:
        stdout.write('Professor ID to remove: ');
        int id = int.parse(stdin.readLineSync() ?? '');
        university.removeProfessorById(id);
        break;

      case 0:
        print('Exiting.');
        break;

      default:
        print('Invalid choice!');
    }
  } while (choice != 0);
}
