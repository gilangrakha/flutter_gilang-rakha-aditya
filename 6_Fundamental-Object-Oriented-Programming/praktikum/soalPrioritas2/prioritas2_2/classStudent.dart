import 'classCourse.dart';

class Student{
  String nama;
  String kelas;
  List<Course> daftarCourse = [];

  Student(this.nama, this.kelas);

  void tambahCourse(Course course){
    daftarCourse.add(course);
    print('Course ${course.judul} berhasil ditambahkan');
  }

  void hapusCourse(Course course){
    daftarCourse.remove(course);
    print('Course ${course.judul} berhasil dihapus');
  }

  void lihatCourse(){
    print('\nDaftar course $nama adalah :');
    for (var course in daftarCourse) {
      print("- ${course.judul}: ${course.deskripsi}\n");
    }
  }
}