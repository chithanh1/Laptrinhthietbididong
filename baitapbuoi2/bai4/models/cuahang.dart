import 'dienthoai.dart';
import 'hoadon.dart';

class CuaHang {
  // Thuộc tính
  String tenCuaHang;
  String diaChi;
  List<DienThoai> danhSachDienThoai; // Danh sách điện thoại
  List<HoaDon> danhSachHoaDon; // Danh sách hóa đơn

  // Constructor
  CuaHang({
    required this.tenCuaHang,
    required this.diaChi,
  })  : danhSachDienThoai = [],
        danhSachHoaDon = [];

  // Thêm điện thoại vào cửa hàng
  void themDienThoai(DienThoai dienThoai) {
    danhSachDienThoai.add(dienThoai);
    print("Đã thêm điện thoại: ${dienThoai.tenDienThoai}");
  }

  // Cập nhật thông tin điện thoại
  void capNhatDienThoai(String maDienThoai, DienThoai dienThoaiCapNhat) {
    for (int i = 0; i < danhSachDienThoai.length; i++) {
      if (danhSachDienThoai[i].maDienThoai == maDienThoai) {
        danhSachDienThoai[i] = dienThoaiCapNhat;
        print("Đã cập nhật điện thoại: ${dienThoaiCapNhat.tenDienThoai}");
        return;
      }
    }
    print("Không tìm thấy điện thoại với mã: $maDienThoai");
  }

  // Ngừng kinh doanh một điện thoại
  void ngungKinhDoanh(String maDienThoai) {
    for (var dt in danhSachDienThoai) {
      if (dt.maDienThoai == maDienThoai) {
        dt.trangThai = false; // Đánh dấu là ngừng kinh doanh
        print("Đã ngừng kinh doanh điện thoại: ${dt.tenDienThoai}");
        return;
      }
    }
    print("Không tìm thấy điện thoại với mã: $maDienThoai");
  }

  // Tìm kiếm điện thoại theo từ khóa
  List<DienThoai> timKiemDienThoai(String keyword) {
    return danhSachDienThoai.where((dt) =>
        dt.tenDienThoai.toLowerCase().contains(keyword.toLowerCase())).toList();
  }

  // Hiển thị danh sách điện thoại
  void hienThiDanhSachDienThoai() {
    print("Danh sách điện thoại:");
    for (var dt in danhSachDienThoai) {
      dt.hienThiThongTin();
    }
  }

  // Tạo hóa đơn
  void taoHoaDon(HoaDon hoaDon) {
    danhSachHoaDon.add(hoaDon);
    hoaDon.dienThoai.capNhatSoLuongTonKho(-hoaDon.soLuongMua); // Cập nhật tồn kho
    print("Đã tạo hóa đơn: ${hoaDon.maHoaDon}");
  }

  // Tìm kiếm hóa đơn theo từ khóa
  List<HoaDon> timKiemHoaDon(String keyword) {
    return danhSachHoaDon.where((hd) =>
        hd.tenKhachHang.toLowerCase().contains(keyword.toLowerCase()) ||
        hd.maHoaDon.toLowerCase().contains(keyword.toLowerCase())).toList();
  }

  // Hiển thị danh sách hóa đơn
  void hienThiDanhSachHoaDon() {
    print("Danh sách hóa đơn:");
    for (var hd in danhSachHoaDon) {
      hd.hienThiThongTinHoaDon();
    }
  }

  // Tính tổng doanh thu trong khoảng thời gian
  double tinhTongDoanhThu(DateTime tuNgay, DateTime denNgay) {
    double tongDoanhThu = 0;
    for (var hd in danhSachHoaDon) {
      if (hd.ngayBan.isAfter(tuNgay) && hd.ngayBan.isBefore(denNgay)) {
        tongDoanhThu += hd.tinhTongTien();
      }
    }
    return tongDoanhThu;
  }

    // Tính tổng lợi nhuận trong khoảng thời gian
  double tinhTongLoiNhuan(DateTime tuNgay, DateTime denNgay) {
    double tongLoiNhuan = 0;
    for (var hd in danhSachHoaDon) {
      if (hd.ngayBan.isAfter(tuNgay) && hd.ngayBan.isBefore(denNgay)) {
        tongLoiNhuan += hd.tinhLoiNhuanThucTe(); // Tính lợi nhuận thực tế từ hóa đơn
      }
    }
    return tongLoiNhuan; // Trả về tổng lợi nhuận
  }
}
