import 'classCourse.dart';
import 'classStudent.dart';

void main (){
  Course webDev = Course('Web Developer', 'course belajar web, html, dan css');
  Course mobDev = Course('Mobile Developer', 'course belajar mobile app flutter dan dart');
  
  Student siswa1 = Student('gilang', 'A1');

  siswa1.tambahCourse(webDev);
  siswa1.tambahCourse(mobDev);

  siswa1.lihatCourse();

  siswa1.hapusCourse(mobDev);
}