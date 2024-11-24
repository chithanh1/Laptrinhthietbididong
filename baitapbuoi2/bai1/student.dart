class Student {
  String _HoTen;
  int _tuoi;
  String _maSV;
  double _DiemTB;

//constructor
  Student(this._HoTen, this._tuoi, this._maSV, this._DiemTB);

//getter
  String get Hoten => _HoTen;
  int get tuoi => _tuoi;
  String get maSV => _HoTen;
  double get DiemTB => _DiemTB;
// setter
  set HoTen(String HoTen) {
    if (HoTen.isNotEmpty) {
      _HoTen = HoTen;
    }
  }

  set tuoi(int tuoi) {
    if (tuoi > 0) {
      _tuoi = tuoi;
    }
  }

  set maSV(String maSV) {
    if (maSV.isNotEmpty) {
      _maSV = maSV;
    }
  }

  set DiemTB(double DiemTB) {
    if (DiemTB >= 0 && DiemTB <= 10) {
      _DiemTB = DiemTB;
    }
  }

  void hienthithongtin() {
    print('ho ten : $Hoten');
    print('tuoi : $_tuoi');
    print('maSV : $_maSV');
    print('DiemTB : $DiemTB');
  }

  String xeploai() {
    if (_DiemTB >= 8.0) return 'Giỏi';
    if (_DiemTB >= 6.5) return 'Khá';
    if (_DiemTB >= 5.0) return 'Trung bình';
    return 'Yếu';
  }
  // lop lophoc
 class LopHoc {
  String _tenLop;
  List<Student> _danhSachSV = [];

  // Constructor
  LopHoc(this._tenLop);

  // Getter cho tên lớp
  String get tenLop => _tenLop;

  // Setter cho tên lớp
  set tenLop(String tenLop) {
    if (tenLop.isNotEmpty) {
      _tenLop = tenLop;
    } 
  }

  // Getter cho danh sách sinh viên
  List<Student> get danhSachSV => _danhSachSV;
  // them sinh vien
  void themStudent(Student sv) => _danhSachSV.add(sv);

  void hienthidanhsach (){
    print('\n----------------------------------------------------');
     print('\n----------------------------------------------------');
      print('\n danh sach sinh v')

  }
}

void main() {
  var sv = Student('Nguyen Van A', 20, 'SV001', 8.5);
  print('Test getter: ${sv.hoTen}');
  sv.hoTen = 'Nguyen Van B';
  print('Sau khi set: ${sv.hoTen}');
  print('Xep loai: ${sv.xepLoai()}');


  var lop = LopHoc('21DTHD5');
  lop.themSinhVien(Student('Nguyen Van A', 20, 'SV001', 8.5));
  lop.themSinhVien(Student('Nguyen Van B', 21, 'SV002', 6.5));
  lop.themSinhVien(Student('Nguyen Van C', 22, 'SV003', 5.5));
  lop.themSinhVien(Student('Nguyen Van F', 23, 'SV004', 4));
  lop.hienThiDanhSach();
}
}
