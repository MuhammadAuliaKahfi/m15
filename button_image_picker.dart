import 'package:flutter/material.dart';
import 'package:flutter_application_15/pertemuan15/pertemuan15_provider.dart';
import 'package:provider/provider.dart';

class ButtonImagePicker extends StatefulWidget {
  final String title;
  final bool isGallery
  const ButtonImagePicker(
    {Key? key, required this.isGallery, required this.title})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<pertemuan15Provider>(context);
    return ElevatedButton(onPressed: () async{
      await prov.pickimage(isGallery);
    }, child: Text(title));
  }

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<pertemuan15Provider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pertemuan15'),
      ),
      body: ListView(
        children: [
          prov.isImageLoaded == true
          ? Image.file(file(prov.img!.path))
          :Container(),
        Padding
        (padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            ButtonImagePicker(isGallery: true, title: 'open gallery'),
            TextButton(
              onPressed: () async{
                var pilihGambar = ImagePicker();
                var hasil = await pilihGambar.pickMultiImage();

                if (hasil == null) {
                  print('Tidak ada foto');
                }
                else {
                  setState(() {
                    listImg = hasil;
                  });
                }
              }, 
              child: Text('Multi Image'))
            ButtonImagePicker(isGallery: false, title: 'Camera'),

          ],),)
        ],
      ),
    )
  }
}