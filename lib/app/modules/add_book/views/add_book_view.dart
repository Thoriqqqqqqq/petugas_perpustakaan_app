import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_book_controller.dart';

class AddBookView extends GetView<AddBookController> {
  const AddBookView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddBookView'),
        centerTitle: true,
      ),
      body:Center(
    child: Form(
    key: controller.formKey,
      child: Column(
        children: [

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: TextFormField(
              controller: controller.judulController,
              decoration: InputDecoration(
                  hintText: "Masukkan judul",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
              validator: (value) {
                if (value!.isEmpty) {
                  return "judul tidak boleh kosong";
                }
                return null;
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: TextFormField(
              controller: controller.penulisController,
              decoration: InputDecoration(
                  hintText: "Masukkan penulis",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
              validator: (value) {
                if (value!.isEmpty) {
                  return "penulis tidak boleh kosong";
                }
                return null;
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: TextFormField(
              controller: controller.penerbitController,
              decoration: InputDecoration(
                  hintText: "Masukkan penerbit",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
              validator: (value) {
                if (value!.isEmpty) {
                  return "penerbit tidak boleh kosong";
                }
                return null;
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: TextFormField(
              controller: controller.tahunTerbitController,
              decoration: InputDecoration(
                  hintText: "Masukkan tahun terbit",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
              validator: (value) {
                if (value!.isEmpty) {
                  return "tahun terbit tidak boleh kosong";
                }
                return null;
              },
            ),
          ),

          Obx(
                () => controller.loadingbook.value
                ? CircularProgressIndicator()
                : ElevatedButton(
                onPressed: () {
                  controller.post();
                },
                child: Text("tambah")),
          )
        ],
      ),
    )),
    );
  }
}
