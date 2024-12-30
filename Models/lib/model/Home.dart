import 'package:flutter/material.dart';

class FoodShopHomePage extends StatefulWidget {
  @override
  _FoodShopHomePageState createState() => _FoodShopHomePageState();
}

class _FoodShopHomePageState extends State<FoodShopHomePage> {
  List<Map<String, dynamic>> cart = [];

  void addToCart(String productName, String price) {
    setState(() {
      cart.add({"name": productName, "price": price});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.shopping_bag),
            SizedBox(width: 8),
            Text('Shop In'),
            Spacer(),
            TextButton(
              onPressed: () {},
              child: Text(
                'Đăng Nhập',
                style: TextStyle(color: Colors.white),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Đăng Ký',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Highlight Section
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          'https://via.placeholder.com/400x200',
                          width: double.infinity,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 16,
                        left: 16,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '40 món ngon khảo miễn phí hôm nay',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                              ),
                              child: Text('Nhận ngay'),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                // Carousel Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage('https://via.placeholder.com/50'),
                        radius: 25,
                      ),
                      CircleAvatar(
                        backgroundImage: NetworkImage('https://via.placeholder.com/50'),
                        radius: 25,
                      ),
                      CircleAvatar(
                        backgroundImage: NetworkImage('https://via.placeholder.com/50'),
                        radius: 25,
                      ),
                      CircleAvatar(
                        backgroundImage: NetworkImage('https://via.placeholder.com/50'),
                        radius: 25,
                      ),
                    ],
                  ),
                ),

                // Suggested Items Section
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Món Ngon Nên Thử!',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ...List.generate(4, (index) {
                  String productName = 'Món ăn ${index + 1}';
                  String productPrice = '15,000 VND';
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Card(
                      child: ListTile(
                        leading: Image.network(
                          'https://via.placeholder.com/100x100',
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                        title: Text(productName),
                        subtitle: Row(
                          children: [
                            Text(
                              productPrice,
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 8),
                            Text(
                              '20,000 VND',
                              style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.add_shopping_cart),
                          onPressed: () {
                            addToCart(productName, productPrice);
                          },
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartDetailsPage(cart: cart)),
                  );
                },
                icon: Icon(Icons.shopping_cart),
                label: Text('Xem giỏ hàng (${cart.length})'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: Size(double.infinity, 50),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CartDetailsPage extends StatelessWidget {
  final List<Map<String, dynamic>> cart;

  CartDetailsPage({required this.cart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chi Tiết Giỏ Hàng'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Danh Sách Sản Phẩm',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: cart.map((item) {
                  return Card(
                    child: ListTile(
                      leading: Image.network(
                        'https://via.placeholder.com/100x100',
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                      title: Text(item['name']),
                      subtitle: Text('Số lượng: 1'),
                      trailing: Text(
                        item['price'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tổng cộng:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${cart.fold<int>(0, (sum, item) => sum + int.parse(item['price'].replaceAll(",", "").replaceAll(" VND", "")))} VND',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Thanh Toán'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}