import '../models/sinh_vien.dart';

// Lop LopHoc
class LopHoc{
  String _tenLop;
  List<SinhVien> _danhSachSV = [];

  LopHoc(this._tenLop);

  // Getters
  String get tenLop => _tenLop;
  List<SinhVien> get danhSachSV => _danhSachSV;

  // Setters
  set tenLop(String tenLop){
    if(tenLop.isNotEmpty){
      _tenLop = tenLop;
    }
  }
  // Thêm sinh viên
  void themSinhVien(SinhVien sv) => _danhSachSV.add(sv);

  void hienThiDanhSach(){
    print('\n----------------------------');
    print('\n----------------------------');
    print('\nDanh sách sinh viên lớp $_tenLop');
    for(var sv in _danhSachSV){
      print('\n----------------------------');
      sv.hienThiThongTin();
      print('\nXếp loại: ${sv.xepLoai()}');
    }
  }
}