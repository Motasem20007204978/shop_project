import 'package:flutter/material.dart';
import 'package:shop_project/samsung_products.dart';
import 'app_drawer.dart';

class Category extends StatelessWidget {
  static const routeName = '/Category';

  const Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Categories"),
        centerTitle: true,
      ),
      body: _body(context),
      drawer: const AppDrawer(),
    );
  }

  Widget _body(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(15),
      children: [
        _samsung(context),
        _iphone(context),
        _oppo(context),
        _huawi(context),
        _xiaomi(context),
        _lenova(context),
      ],
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 1,
        crossAxisSpacing: 50,
        mainAxisSpacing: 50,
      ),
    );
  }

  ElevatedButton _samsung(BuildContext context) {
    Map<String, dynamic> info = {
      'textColor': Colors.white,
      'primaryColor': Colors.purple,
      'message':
          'Samsung, South Korean company that is one of the world`s largest producers of electronic devices.',
      'textText': 'SAMSUNG Galaxy A53 5G'
    };
    Future _samProducts() {
      return Navigator.push(context,
          MaterialPageRoute(builder: (context) => const SamsungProducts()));
    }

    return _elevationButton(context, info['textColor'], info['primaryColor'],
        info['textText'], info['message'],
        catProducts: _samProducts);
  }

  ElevatedButton _iphone(BuildContext context) {
    Map<String, dynamic> info = {
      'textColor': Colors.red,
      'primaryColor': Colors.white,
      'message':
          'The iPhone is a smartphone made by Apple that combines a computer, iPod, digital camera and cellular phone into one device with a touchscreen interface.',
      'textText': 'iPhone XS'
    };
    return _elevationButton(context, info['textColor'], info['primaryColor'],
        info['textText'], info['message']);
  }

  ElevatedButton _oppo(BuildContext context) {
    Map<String, dynamic> info = {
      'textColor': Colors.black,
      'primaryColor': Colors.greenAccent,
      'message':
          'Guangdong Oppo Mobile Telecommunications Corp., Ltd, doing business as OPPO, is a Chinese consumer electronics and mobile communications company headquartered in Dongguan, Guangdong.',
      'textText': 'Oppo Find X5 Pro'
    };
    return _elevationButton(context, info['textColor'], info['primaryColor'],
        info['textText'], info['message']);
  }

  ElevatedButton _huawi(BuildContext context) {
    Map<String, dynamic> info = {
      'textColor': Colors.cyan,
      'primaryColor': Colors.redAccent,
      'message':
          'Huawei is a Chinese information and communications technology (ICT) company that specializes in telecommunications equipment.',
      'textText': 'Huawei P30 Pro'
    };
    return _elevationButton(context, info['textColor'], info['primaryColor'],
        info['textText'], info['message']);
  }

  ElevatedButton _xiaomi(BuildContext context) {
    Map<String, dynamic> info = {
      'textColor': Colors.red,
      'primaryColor': Colors.blueAccent,
      'message':
          'Xiaomi is a consumer electronics and smart manufacturing company with smartphones and smart hardware connected by an IoT platform at its core.',
      'textText': 'Xiaomi Redmi Note 10 Pro'
    };
    return _elevationButton(context, info['textColor'], info['primaryColor'],
        info['textText'], info['message']);
  }

  ElevatedButton _lenova(BuildContext context) {
    Map<String, dynamic> info = {
      'textColor': Colors.red,
      'primaryColor': Colors.amber,
      'message':
          'Lenovo is one of the world`s leading personal technology companies, producing innovative PCs and mobile internet devices.',
      'textText': 'LENOVO Legion Y700'
    };

    return _elevationButton(context, info['textColor'], info['primaryColor'],
        info['textText'], info['message']);
  }

  ElevatedButton _elevationButton(BuildContext context, Color _textColor,
      Color _primaryColor, String _textText, String _message,
      {Function()? catProducts}) {
    return ElevatedButton(
      onPressed: catProducts ?? (){},
      child: Tooltip(
        message: _message,
        height: 50,
        verticalOffset: 5,
        child: Text(
          _textText,
          textAlign: TextAlign.center,
          style: TextStyle(color: _textColor),
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: _primaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
