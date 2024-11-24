class DienThoai {
  // Thuộc tính
  String maDienThoai;
  String tenDienThoai;
  String hangSanXuat;
  double giaBan;
  int soLuongTonKho;
  bool trangThai; // true: đang kinh doanh, false: ngừng kinh doanh

  // Constructor
  DienThoai({
    required this.maDienThoai,
    required this.tenDienThoai,
    required this.hangSanXuat,
    required this.giaBan,
    required this.soLuongTonKho,
    this.trangThai = true, // Mặc định là đang kinh doanh
  }) {
    // Kiểm tra tính hợp lệ của mã điện thoại
    if (maDienThoai.isEmpty) {
      throw Exception("Mã điện thoại không được để trống.");
    }
    // Kiểm tra giá bán không âm
    if (giaBan < 0) {
      throw Exception("Giá bán không được âm.");
    }
    // Kiểm tra số lượng tồn kho không âm
    if (soLuongTonKho < 0) {
      throw Exception("Số lượng tồn kho không được âm.");
    }
  }

  // Phương thức hiển thị thông tin điện thoại
  void hienThiThongTin() {
    print("Mã: $maDienThoai, Tên: $tenDienThoai, Hãng: $hangSanXuat, Giá: $giaBan, Tồn kho: $soLuongTonKho, Trạng thái: ${trangThai ? 'Kinh doanh' : 'Ngừng kinh doanh'}");
  }

  // Phương thức cập nhật số lượng tồn kho
  void capNhatSoLuongTonKho(int soLuong) {
    if (soLuong < 0 && soLuongTonKho + soLuong < 0) {
      throw Exception("Số lượng tồn kho không đủ để giảm.");
    }
    soLuongTonKho += soLuong;
  }
}