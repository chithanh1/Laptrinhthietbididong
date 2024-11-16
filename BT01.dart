//baitap02.dart
//giai phuong trinh bat 2 ax^2+bx+c = 0;
import 'dart:io';
import 'dart:math';

void main() {
  // Nhập hệ số a (a khác 0)
  stdout.write('Nhập hệ số a (a khác 0): ');
  double a = double.parse(stdin.readLineSync()!);

  // Kiểm tra nếu a == 0 thì không phải phương trình bậc 2
  if (a == 0) {
    print('Không phải phương trình bậc 2.');
    return;
  }

  // Nhập hệ số b
  stdout.write('Nhập hệ số b: ');
  double b = double.parse(stdin.readLineSync()!);

  // Nhập hệ số c
  stdout.write('Nhập hệ số c: ');
  double c = double.parse(stdin.readLineSync()!);

  // Tính Delta
  double delta = b * b - 4 * a * c;

  // Giải phương trình
  if (delta > 0) {
    // Phương trình có 2 nghiệm phân biệt
    print('Phương trình có 2 nghiệm phân biệt:');
    print('x1 = ${(-b + sqrt(delta)) / (2 * a)}');
    print('x2 = ${(-b - sqrt(delta)) / (2 * a)}');
  } else if (delta == 0) {
    // Phương trình có nghiệm kép
    print('Phương trình có nghiệm kép:');
    print('x = ${-b / (2 * a)}');
  } else {
    // Phương trình vô nghiệm
    print('Phương trình vô nghiệm.');
  }
}
