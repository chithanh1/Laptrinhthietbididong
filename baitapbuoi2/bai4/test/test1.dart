import '..//models/cuahang.dart';
import '..//models/dienthoai.dart';
import '..//models/hoadon.dart';
import 'dart:core'; // Thư viện cơ bản, thường không cần thiết vì nó được import mặc định.

// Nếu bạn cần sử dụng các chức năng liên quan đến I/O (nhập/xuất).
void main() {
  // Tạo cửa hàng
  CuaHang cuaHang =
      CuaHang(tenCuaHang: "Cửa Hàng Điện Thoại XYZ", diaChi: "123 Đường ABC");

  // Tạo một số điện thoại
  DienThoai dienThoai1 = DienThoai(
    maDienThoai: "DT-001",
    tenDienThoai: "Điện thoại A",
    hangSanXuat: "Hãng A",
    // giaNhap: 5000000,
    giaBan: 7000000,
    soLuongTonKho: 100,
    trangThai: true,
  );

  DienThoai dienThoai2 = DienThoai(
    maDienThoai: "DT-002",
    tenDienThoai: "Điện thoại B",
    hangSanXuat: "Hãng B",
    // giaNhap: 6000000,
    giaBan: 8000000,
    soLuongTonKho: 50,
    trangThai: true,
  );

  // Thêm điện thoại vào cửa hàng
  cuaHang.themDienThoai(dienThoai1);
  cuaHang.themDienThoai(dienThoai2);

  // Hiển thị danh sách điện thoại
  print("Danh sách điện thoại:");
  cuaHang.hienThiDanhSachDienThoai();

  // Tạo hóa đơn
  HoaDon hoaDon1 = HoaDon(
    maHoaDon: "HD-001",
    // ngayBan: DateTime.now(),
    dienThoai: dienThoai1,
    soLuongMua: 2,
    // giaBanThucTe: 7000000,
    tenKhachHang: "Nguyễn Văn A",
    soDienThoaiKhach: "0123456789",
  );

  // Tạo hóa đơn
  cuaHang.taoHoaDon(hoaDon1);

  // Hiển thị danh sách hóa đơn
  print("\nDanh sách hóa đơn:");
  cuaHang.hienThiDanhSachHoaDon();

  // Tính tổng doanh thu
  double doanhThu = cuaHang.tinhTongDoanhThu(
      DateTime.now().subtract(Duration(days: 1)), DateTime.now());
  print("\nTổng doanh thu: $doanhThu");

  // Tính lợi nhuận
  double loiNhuan = cuaHang.tinhTongLoiNhuan(
      DateTime.now().subtract(Duration(days: 1)), DateTime.now());
  print("Tổng lợi nhuận: $loiNhuan");

  // // Thống kê top điện thoại bán chạy *
  // List<DienThoai> topDienThoai = cuaHang.thongKeTopDienThoaiBanChay(1);
  // print("\nTop điện thoại bán chạy:");
  // for (var dt in topDienThoai) {
  //   print(dt.hienThiThongTin());
  // }
  //bao cao ton kho *
}
