
import 'package:flutter/material.dart';

// WARNA APLIKASI
const Color kuning = Color(0xFFFFC107);
const Color latar = Color(0xFFFFFDE7);

// MODEL PRODUK
class Produk {
  final String nama;
  final String harga;
  final String gambar;
  final IconData ikon;
  final double rating;
  bool favorit;

  Produk({
    required this.nama,
    required this.harga,
    required this.gambar,
    required this.ikon,
    required this.rating,
    this.favorit = false,
  });
}

// HALAMAN KATALOG
class HalamanKatalog extends StatefulWidget {
  const HalamanKatalog({super.key});

  @override
  State<HalamanKatalog> createState() => _HalamanKatalogState();
}

class _HalamanKatalogState extends State<HalamanKatalog> {

  // DATA PRODUK
  final List<Produk> daftarProduk = [
    Produk(
      nama: 'Beras',
      harga: 'Rp15.000 / kg',
      gambar: 'https://images.unsplash.com/photo-1586201375761-83865001e31c?w=500',
      ikon: Icons.rice_bowl,
      rating: 4.5,
    ),
    Produk(
      nama: 'Minyak Goreng',
      harga: 'Rp18.000 / liter',
      gambar: 'https://images.unsplash.com/photo-1474979266404-7eaacbcd87c5?w=500',
      ikon: Icons.water_drop,
      rating: 4.7,
    ),
    Produk(
      nama: 'Telur Ayam',
      harga: 'Rp28.000 / kg',
      gambar: 'https://images.unsplash.com/photo-1506976785307-8732e854ad03?w=500',
      ikon: Icons.egg,
      rating: 4.8,
    ),
    Produk(
      nama: 'Susu',
      harga: 'Rp20.000 / kotak',
      gambar: 'https://images.unsplash.com/photo-1563636619-e9143da7973b?w=500',
      ikon: Icons.local_drink,
      rating: 4.6,
    ),
    Produk(
      nama: 'Roti',
      harga: 'Rp12.000 / bungkus',
      gambar: 'https://images.unsplash.com/photo-1509440159596-0249088772ff?w=500',
      ikon: Icons.bakery_dining,
      rating: 4.5,
    ),
    Produk(
      nama: 'Apel',
      harga: 'Rp25.000 / kg',
      gambar: 'https://images.unsplash.com/photo-1560806887-1e4cd0b6cbd6?w=500',
      ikon: Icons.apple,
      rating: 4.9,
    ),
    Produk(
      nama: 'Sayuran',
      harga: 'Rp10.000 / ikat',
      gambar: 'https://images.unsplash.com/photo-1540420773420-3366772f4999?w=500',
      ikon: Icons.eco,
      rating: 4.7,
    ),
    Produk(
      nama: 'Jeruk',
      harga: 'Rp18.000 / kg',
      gambar: 'https://images.unsplash.com/photo-1547514701-42782101795e?w=500',
      ikon: Icons.circle,
      rating: 4.6,
    ),
  ];

  // FUNGSI FAVORIT DAN SNACKBAR
  void toggleFavorit(int index) {
    setState(() {
      daftarProduk[index].favorit =
          !daftarProduk[index].favorit;
    });

    final p = daftarProduk[index];

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 2),
          content: Row(
            children: [
              Icon(
                p.favorit
                    ? Icons.check_circle
                    : Icons.remove_circle,
                color: p.favorit
                    ? Colors.greenAccent
                    : Colors.orangeAccent,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  p.favorit
                      ? '${p.nama} ditambahkan ke Favorit'
                      : '${p.nama} dihapus dari Favorit',
                ),
              ),
            ],
          ),
        ),
      );
  }

  // WIDGET GAMBAR PRODUK
  Widget gambarProduk(Produk p) {
    return Image.network(
      p.gambar,
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          color: const Color(0xFFFFF3CD),
          child: Icon(
            p.ikon,
            size: 55,
            color: Colors.orange,
          ),
        );
      },
    );
  }

  // WIDGET TOMBOL FAVORIT
  Widget tombolFavorit(int index) {
    final p = daftarProduk[index];

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: () => toggleFavorit(index),
        icon: Icon(
          p.favorit
              ? Icons.favorite
              : Icons.favorite_border,
          color: p.favorit ? Colors.red : Colors.grey,
        ),
        iconSize: 21,
        padding: const EdgeInsets.all(7),
        constraints: const BoxConstraints(),
      ),
    );
  }

  // WIDGET RATING
  Widget ratingProduk(double rating) {
    return Row(
      children: [
        const Icon(
          Icons.star,
          color: Colors.amber,
          size: 18,
        ),
        const SizedBox(width: 4),
        Text(
          rating.toString(),
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: latar,

      // APP BAR
      appBar: AppBar(
        backgroundColor: kuning,
        foregroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          'Katalog Produk',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: LayoutBuilder(
        builder: (context, constraints) {
          final kolom =
              constraints.maxWidth >= 600 ? 3 : 2;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // JUDUL
                const Text(
                  'Produk Kebutuhan Sehari-hari',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 5),

                const Text(
                  'Temukan berbagai produk pilihan untukmu.',
                  style: TextStyle(
                    color: Colors.black54,
                  ),
                ),

                const SizedBox(height: 22),

                // BAGIAN LISTVIEW
                const Text(
                  'Pilihan Produk',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 12),

                SizedBox(
                  height: 205,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: daftarProduk.length,
                    itemBuilder: (context, index) {
                      final p = daftarProduk[index];

                      return Container(
                        width: 155,
                        margin: const EdgeInsets.only(
                          right: 12,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(14),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.08),
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Stack(
                                children: [
                                  Positioned.fill(
                                    child: ClipRRect(
                                      borderRadius:
                                          const BorderRadius.vertical(
                                        top: Radius.circular(14),
                                      ),
                                      child: gambarProduk(p),
                                    ),
                                  ),
                                  Positioned(
                                    top: 5,
                                    right: 5,
                                    child: tombolFavorit(index),
                                  ),
                                ],
                              ),
                            ),

                            Padding(
                              padding:
                                  const EdgeInsets.all(9),
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    p.nama,
                                    maxLines: 1,
                                    overflow:
                                        TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontWeight:
                                          FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    p.harga,
                                    style: const TextStyle(
                                      fontSize: 11,
                                      color: Colors.deepOrange,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  ratingProduk(p.rating),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 25),

                // BAGIAN GRIDVIEW
                const Text(
                  'Semua Produk',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 12),

                GridView.builder(
                  shrinkWrap: true,
                  physics:
                      const NeverScrollableScrollPhysics(),
                  itemCount: daftarProduk.length,
                  gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: kolom,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.78,
                  ),
                  itemBuilder: (context, index) {
                    final p = daftarProduk[index];

                    return Card(
                      color: Colors.white,
                      elevation: 3,
                      shadowColor: Colors.black26,
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(14),
                      ),
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: gambarProduk(p),
                                ),
                                Positioned(
                                  top: 6,
                                  right: 6,
                                  child: tombolFavorit(index),
                                ),
                              ],
                            ),
                          ),

                          Padding(
                            padding:
                                const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                Text(
                                  p.nama,
                                  maxLines: 1,
                                  overflow:
                                      TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),

                                const SizedBox(height: 5),

                                Text(
                                  p.harga,
                                  style: const TextStyle(
                                    color: Colors.deepOrange,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),

                                const SizedBox(height: 5),

                                ratingProduk(p.rating),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
