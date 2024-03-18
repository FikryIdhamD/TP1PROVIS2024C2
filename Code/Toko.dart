import 'dart:async';

// Kelas dasar untuk merepresentasikan produk
class Product {
  String name;
  double price;

  Product(this.name, this.price);
}

// Kelas turunan untuk merepresentasikan produk elektronik
class ElectronicProduct extends Product {
  String brand;

  ElectronicProduct(String name, double price, this.brand) : super(name, price);
}

// Kelas turunan untuk merepresentasikan produk makanan
class FoodProduct extends Product {
  String expirationDate;

  FoodProduct(String name, double price, this.expirationDate) : super(name, price);
}

// Kelas untuk manajemen stok toko
class StockManager {
  List<Product> products;

  StockManager(this.products);

  // Metode untuk mencari produk berdasarkan nama
  Future<Product> searchProduct(String name) async {
    // Simulasi penelusuran asynchronous
    return Future.delayed(Duration(seconds: 2), () {
      for (var product in products) {
        if (product.name == name) {
          return product;
        }
      }
      throw Exception('Produk dengan nama $name tidak ditemukan.'); // Melempar exception jika produk tidak ditemukan
    });
  }
}

void main() {
  // Inisialisasi beberapa produk
  List<Product> products = [
    ElectronicProduct('Smartphone', 1000, 'Samsung'),
    ElectronicProduct('Laptop', 1500, 'HP'),
    FoodProduct('Chocolate', 5, '2024-03-25'),
  ];

  // Membuat objek StockManager
  StockManager Alvian = StockManager(products);

  // Memulai pencarian produk dengan nama tertentu secara asynchronous
  Alvian.searchProduct('Strawberry').then((product) {
    print('Produk ditemukan:');
    print('Nama: ${product.name}');
    print('Harga: \$${product.price}');
    if (product is ElectronicProduct) {
      print('Merk: ${product.brand}');
    } else if (product is FoodProduct) {
      print('Tgl. Kadaluarsa: ${product.expirationDate}');
    }
  }).catchError((error) {
    print('Error: $error'); // Menangkap dan menampilkan pesan kesalahan
  }).whenComplete(() {
    print('Pencarian produk selesai.'); // Menampilkan pesan ketika pencarian selesai
  });

  print('Memulai pencarian produk...');
}
