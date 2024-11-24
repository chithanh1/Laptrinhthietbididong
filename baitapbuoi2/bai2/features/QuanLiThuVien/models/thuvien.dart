// class DocGia {
//   String _maDocGia;
//   String _tenDocGia;
//   List<Sach> _sachDangMuon = [];

//   DocGia(this._maDocGia, this._tenDocGia);

//   // Getters
//   String get maDocGia => _maDocGia;
//   String get tenDocGia => _tenDocGia;
//   List<Sach> get sachDangMuon => _sachDangMuon;

//   // Thêm sách vào danh sách mượn
//   void muonSach(Sach sach) {
//     _sachDangMuon.add(sach);
//   }

//   // Xóa sách khỏi danh sách mượn
//   void traSach(Sach sach) {
//     _sachDangMuon.remove(sach);
//   }

//   void hienThiThongTin() {
//     print("Mã độc giả: $_maDocGia, Tên độc giả: $_tenDocGia");
//     print("Sách đang mượn:");
//     for (var sach in _sachDangMuon) {
//       print("- ${sach.tenSach}");
//     }
//   }
// }

// class ThuVien {
//   String _tenThuVien;
//   List<Sach> _danhSachSach = [];
//   List<DocGia> _danhSachDocGia = [];

//   ThuVien(this._tenThuVien);

//   // Thêm sách vào thư viện
//   void themSach(Sach sach) => _danhSachSach.add(sach);

//   // Thêm độc giả
//   void themDocGia(DocGia docGia) => _danhSachDocGia.add(docGia);

//   // Kiểm tra sách đã mượn chưa
//   bool kiemTraSachMuon(String maSach) {
//     return _danhSachSach.any((sach) => sach.maSach == maSach && sach.trangThaiMuon == "Đang mượn");
//   }

//   // Mượn sách
//   void muonSach(String maDocGia, String maSach) {
//     var docGia = _danhSachDocGia.firstWhere(
//       (dg) => dg.maDocGia == maDocGia,
//       orElse: () => throw ArgumentError("Không tìm thấy độc giả với mã: $maDocGia"),
//     );

//     var sach = _danhSachSach.firstWhere(
//       (sach) => sach.maSach == maSach,
//       orElse: () => throw ArgumentError("Không tìm thấy sách với mã: $maSach"),
//     );

//     if (kiemTraSachMuon(maSach)) {
//       print("Sách '${sach.tenSach}' đã được mượn.");
//     } else if (sach.trangThaiMuon == "Có sẵn") {
//       sach.trangThaiMuon = "Đang mượn";
//       docGia.muonSach(sach);
//       print("Độc giả '${docGia.tenDocGia}' đã mượn sách '${sach.tenSach}'.");
//     } else {
//       print("Sách '${sach.tenSach}' không sẵn sàng để mượn.");
//     }
//   }

//   // Trả sách
//   void traSach(String maDocGia, String maSach) {
//     var docGia = _danhSachDocGia.firstWhere(
//       (dg) => dg.maDocGia == maDocGia,
//       orElse: () => throw ArgumentError("Không tìm thấy độc giả với mã: $maDocGia"),
//     );

//     var sach = docGia.sachDangMuon.firstWhere(
//       (sach) => sach.maSach == maSach,
//       orElse: () => throw ArgumentError("Độc giả '${docGia.tenDocGia}' không mượn sách với mã: $maSach"),
//     );

//     sach.trangThaiMuon = "Có sẵn";
//     docGia.traSach(sach);
//     print("Độc giả '${docGia.tenDocGia}' đã trả sách '${sach.tenSach}'.");
//   }

//   // Hiển thị danh sách sách
//   void hienThiDanhSachSach() {
//     print("\nDanh sách sách trong thư viện $_tenThuVien:");
//     for (var sach in _danhSachSach) {
//       sach.hienThiThongTin();
//     }
//   }

//   // Hiển thị danh sách độc giả
//   void hienThiDanhSachDocGia() {
//     print("\nDanh sách độc giả trong thư viện $_tenThuVien:");
//     for (var docGia in _danhSachDocGia) {
//       docGia.hienThiThongTin();
//     }
//   }
// }

// void main() {
//   // Tạo thư viện
//   ThuVien thuVien = ThuVien("Thư viện Trung tâm");

//   // Tạo sách
//   Sach sach1 = Sach("S001", "Lập trình Dart", "Có sẵn");
//   Sach sach2 = Sach("S002", "Lập trình Flutter", "Có sẵn");
//   Sach sach3 = Sach("S003", "Toán cao cấp", "Có sẵn");

//   // Thêm sách vào thư viện
//   thuVien.themSach(sach1);
//   thuVien.themSach(sach2);
//   thuVien.themSach(sach3);

//   // Tạo độc giả
//   DocGia docGia1 = DocGia("D001", "Nguyễn Văn A");
//   DocGia docGia2 = DocGia("D002", "Trần Thị B");

//   // Thêm độc giả vào thư viện
//   thuVien.themDocGia(docGia1);
//   thuVien.themDocGia(docGia2);

//   // Hiển thị danh sách sách
//   thuVien.hienThiDanhSachSach();

//   // Mượn sách
//   print("\n--- Mượn sách ---");
//   thuVien.muonSach("D001", "S001");
//   thuVien.muonSach("D002", "S002");

//   // Hiển thị danh sách độc giả
//   thuVien.hienThiDanhSachDocGia();

//   // Trả sách
//   print("\n--- Trả sách ---");
//   thuVien.traSach("D001", "S001");

//   // Hiển thị danh sách sau khi trả sách
//   thuVien.hienThiDanhSachDocGia();
//   thuVien.hienThiDanhSachSach();
// }

// // Lop LopHoc
// class LopHoc{
//   String _tenLop;
//   List<SinhVien> _danhSachSV = [];

//   LopHoc(this._tenLop);

//   // Getters
//   String get tenLop => _tenLop;
//   List<SinhVien> get danhSachSV => _danhSachSV;

//   // Setters
//   set tenLop(String tenLop){
//     if(tenLop.isNotEmpty){
//       _tenLop = tenLop;
//     }
//   }
//   // Thêm sinh viên
//   void themSinhVien(SinhVien sv) => _danhSachSV.add(sv);

//   void hienThiDanhSach(){
//     print('\n----------------------------');
//     print('\n----------------------------');
//     print('\nDanh sách sinh viên lớp $_tenLop');
//     for(var sv in _danhSachSV){
//       print('\n----------------------------');
//       sv.hienThiThongTin();
//       print('\nXếp loại: ${sv.xepLoai()}');
//     }
//   }
// }
