import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:petugas_perpustakaan_rpl_b/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 20,
                ),
                Expanded(child: ElevatedButton(
                  onPressed: (){Get.toNamed(Routes.BOOK
                  );}, child: Text('Book'),
                ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(child: ElevatedButton(
                  onPressed: (){Get.toNamed(Routes.PEMINJAMAN);}, child: Text('Peminjaman'),
                ),
                ),
                SizedBox(
                  width: 20,
                ),
              ],
            )
          ],
        )
    );
  }
}
