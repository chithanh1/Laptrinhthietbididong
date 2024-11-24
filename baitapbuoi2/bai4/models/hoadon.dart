import 'dienthoai.dart';

class HoaDon {
  // Thuộc tính
  String maHoaDon;
  String tenKhachHang;
  DienThoai dienThoai; // Tham chiếu đến đối tượng DienThoai
  int soLuongMua;
  DateTime ngayBan;

  // Constructor
  HoaDon({
    required this.maHoaDon,
    required this.tenKhachHang,
    required this.dienThoai,
    required this.soLuongMua, required String soDienThoaiKhach,
  })  : ngayBan = DateTime.now() {
    // Kiểm tra tính hợp lệ của mã hóa đơn và số lượng mua
    if (maHoaDon.isEmpty) {
      throw Exception("Mã hóa đơn không được để trống.");
    }
    if (soLuongMua <= 0) {
      throw Exception("Số lượng mua phải lớn hơn 0.");
    }
    if (soLuongMua > dienThoai.soLuongTonKho) {
      throw Exception("Số lượng mua vượt quá số lượng tồn kho.");
    }
  }

  // Phương thức hiển thị thông tin hóa đơn
  void hienThiThongTinHoaDon() {
    print("Mã hóa đơn: $maHoaDon, Khách hàng: $tenKhachHang, Điện thoại: ${dienThoai.tenDienThoai}, Số lượng: $soLuongMua, Ngày bán: ${ngayBan.toLocal()}");
  }

  // Tính tổng tiền hóa đơn
  double tinhTongTien() {
    return soLuongMua * dienThoai.giaBan;
  }

  // Tính lợi nhuận thực tế
  double tinhLoiNhuanThucTe() {
    // Giả sử lợi nhuận là 20% giá bán
    double loiNhuan = tinhTongTien() * 0.2;
    return loiNhuan;
  }
}