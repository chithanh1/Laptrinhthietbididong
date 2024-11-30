import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  MultiplicationTableApp(),
    );
  }
}

class MultiplicationTableApp extends StatefulWidget {
  @override
  _MultiplicationTableAppState createState() => _MultiplicationTableAppState();
}

class _MultiplicationTableAppState extends State<MultiplicationTableApp> {
  TextEditingController numberController = TextEditingController();
  int? selectedNumber; // Số mà người dùng nhập

  // Hàm cập nhật số nhập từ người dùng
  void updateNumber() {
    setState(() {
      try {
        selectedNumber = int.parse(numberController.text);
      } catch (e) {
        selectedNumber = null; // Nếu nhập không hợp lệ, xóa số đã chọn
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bảng Cửu Chương '),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: numberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Nhập một số',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    numberController.clear();
                    setState(() {
                      selectedNumber = null;
                    });
                  },
                ),
              ),
              onChanged: (value) => updateNumber(),
            ),
            SizedBox(height: 20),
            if (selectedNumber != null) ...[
              Text(
                'Bảng cửu chương của số $selectedNumber:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Table(
                border: TableBorder.all(
                  color: Colors.blue, // Màu đường kẻ
                  width: 2, // Độ dày của đường kẻ
                ),
                children: [
                  for (int i = 1; i <= 9; i++) // Tạo từng dòng bảng
                    TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '$selectedNumber x $i',
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '= ${selectedNumber! * i}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ] else if (numberController.text.isNotEmpty) ...[
              Text(
                'Vui lòng nhập một số hợp lệ.',
                style: TextStyle(color: Colors.red, fontSize: 16),
              ),
            ],
          ],
        ),
      ),
    );
  }
}