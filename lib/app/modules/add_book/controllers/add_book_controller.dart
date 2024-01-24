import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petugas_perpustakaan_rpl_b/app/modules/book/controllers/book_controller.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/provider/api_providerr.dart';

class AddBookController extends GetxController {
  final loadingbook = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController judulController = TextEditingController();
  final TextEditingController penulisController = TextEditingController();
  final TextEditingController penerbitController = TextEditingController();
  final TextEditingController tahunTerbitController = TextEditingController();
  final BookController bookController = Get.find();


  final count = 0.obs;

  get usernameController => null;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  post() async {
    loadingbook(true);
    try {
      FocusScope.of(Get.context!).unfocus();
      formKey.currentState?.save();
      if (formKey.currentState!.validate()){
        final response = await ApiProvider.instance().post(Endpoint.book,
        data:
          {
            "judul":judulController.text.toString(),
            "penulis": penulisController.text.toString(),
            "penerbit": penerbitController.text.toString(),
            "tahun_terbit": int.parse(tahunTerbitController.text.toString())
          }
        );
        if (response.statusCode == 201) {
          bookController.getData();
          Get.back();
        }else{
          Get.snackbar("Sorry", "Login Gagal", backgroundColor: Colors.red);
        }
      }
      loadingbook(false);
    }on DioException catch (e) {
      loadingbook(false);
      if(e.response != null) {
        if(e.response?.data != null){
          Get.snackbar("Sorry", "${e.response?.data['message']}",backgroundColor: Colors.red);
        }
      }else{
        Get.snackbar("Sorry", e.message ??"", backgroundColor: Colors.red);
      }
    }catch (e) {
      loadingbook(false);
      Get.snackbar("Error", e.toString(),backgroundColor: Colors.red);
    }
  }}
