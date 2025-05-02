// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:my_dorm/constant/constant.dart';
import 'package:my_dorm/service/image_service.dart';

class InformasiCard extends StatelessWidget {
  final Map<String, dynamic> item;
  const InformasiCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kWhite,
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage:
                      AssetImage('images/zee.png'), // ganti path jika perlu
                  radius: 20,
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('ayay',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(item['updated_at'] ?? 'error',
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 12)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              item['judul'] ?? 'error',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              item['isi'] ?? 'error',
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
            ),
            const Text(
              'Baca Selengkapnya',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: MyNetworkImage(
                imageURL:
                    'https://mydorm-mobile-backend-production.up.railway.app/images/${item['gambar']}',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
