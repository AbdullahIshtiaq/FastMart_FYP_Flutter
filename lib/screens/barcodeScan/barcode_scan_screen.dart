import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:fyp_frontend/models/MyProduct.dart';

import '../../constants.dart';
import '../../models/Cart.dart';
import '../../models/Wishlist.dart';
import '../../services/api_service.dart';
import '../../utils/shared_preferences.dart';
import '../cart/cart_screen.dart';

class BarcodeScanScreen extends StatefulWidget {
  const BarcodeScanScreen({Key? key}) : super(key: key);

  @override
  State<BarcodeScanScreen> createState() => _BarcodeScanScreenState();
}

class _BarcodeScanScreenState extends State<BarcodeScanScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  //bool _visible = false;
  bool _isScanning = false;
  bool _scan = false;
  bool _found = false;
  MyProduct? product;

  final cartController = Get.put(CartController());
  final wishlistController = Get.put(WishlistController());

  bool inCart = false;
  bool inWishlist = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  bool checkInWishlist() {
    for (var item in wishlistController.wishlistProducts) {
      if (item.productId == product!.productId) {
        return true;
      }
    }
    return false;
  }

  bool checkInCart() {
    for (var item in cartController.cartProducts) {
      if (item.productId == product!.productId) {
        return true;
      }
    }
    return false;
  }

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.resumeCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Scan Barcode",
          style: Theme.of(context).textTheme.headline6,
        ),
        actions: [
          IconButton(
            icon: const Icon(
              CupertinoIcons.cart_fill,
              color: Colors.grey,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CartScreen(),
                  ));
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 300,
            width: 300,
            child: (_scan)
                ? QRView(
                    key: qrKey,
                    onQRViewCreated: _onQRViewCreated,
                  )
                : const Icon(
                    //Icons.qr_code_scanner,
                    CupertinoIcons.barcode_viewfinder,
                    color: Colors.grey,
                    size: 300,
                  ),
          ),
          Center(
            child: (result != null)
                ? Text(
                    'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
                : const Text('Not Scanning'),
          ),
          Center(
            child: SizedBox(
              width: 100,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    result = null;
                    product = null;
                    //_visible = !_visible;
                    _isScanning = false;
                    _scan = !_scan;
                  });
                },
                style: ElevatedButton.styleFrom(
                    primary: primaryColor, shape: const StadiumBorder()),
                child: _isScanning ? const Text("Stop") : const Text("Scan"),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding * 1.5),
          Expanded(
            child: product != null
                ? _productDetails()
                : Center(
                    child: Text(
                      "",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  // @override
  // QRScanScreen get widget => super.widget;

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        print("Line 162:" + result!.code.toString());
        getProductByQR();
      });
    });
  }

  Future<void> getProductByQR() async {
    print("Line 125: In Start");

    if (_isScanning) {
      return;
    }

    if (result == null) {
      return;
    }

    _isScanning = true;

    print("Line 137: In Middle");

    final apiProduct = await APIService.getProductByBarcode(result!.code);
    if (apiProduct != null) {
      setState(() {
        _found = true;
        product = apiProduct;
        inCart = checkInCart();
        inWishlist = checkInWishlist();
        Get.snackbar(
          "Product Found Successfully",
          "",
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 1),
        );

        print("Line 144: " + product.toString());
      });
    } else {
      Get.snackbar(
        "Product Not Found Successfully",
        "",
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 1),
      );
    }

    print("Line 148: In End");
    // _isScanning = false;
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  Widget _productDetails() {
    return Container(
      padding: const EdgeInsets.fromLTRB(
          defaultPadding * 2, 0, defaultPadding * 2, 0),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(defaultBorderRadius * 3),
            topRight: Radius.circular(defaultBorderRadius * 3),
          ),
          boxShadow: myBoxShadow),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: Icon(
                  inWishlist
                      ? CupertinoIcons.heart_solid
                      : CupertinoIcons.heart,
                  color: primaryColor,
                  size: 20,
                ),
                onPressed: () {
                  WishlistProduct model = WishlistProduct(
                      productBarcode: product!.productBarcode,
                      productId: product!.productId,
                      productImg: product!.fullImagePath,
                      productName: product!.productName,
                      productPrice: product!.productPrice.toString());

                  wishlistController.addProductToWishlist(model);
                  UserSharedPreferences.setWishList(
                      wishlistController.wishlistProducts);
                  setState(() {
                    inWishlist = !inWishlist;
                  });
                },
              ),
              IconButton(
                icon: const Icon(
                  CupertinoIcons.xmark,
                  color: primaryColor,
                  size: 20,
                ),
                onPressed: () {
                  setState(() {
                    result = null;
                    product = null;
                    inCart = false;
                    inWishlist = false;
                    //_visible = !_visible;
                    _isScanning = false;
                  });
                },
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(
                      0, 0, defaultPadding, defaultPadding),
                  child: Image.network(
                    product!.fullImagePath,
                    height: 80,
                    width: 80,
                    //fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product!.productName,
                    ),
                    const SizedBox(width: defaultPadding),
                    Text(
                      "Rs. ${product!.productPrice}",
                    ),
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: Text(
              product!.productShortDesc,
            ),
          ),
          const SizedBox(height: defaultPadding * 2),
          Center(
            child: SizedBox(
              width: 200,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  CartProduct model = CartProduct(
                      productId: product!.productId,
                      productImg: product!.fullImagePath,
                      productName: product!.productName,
                      productPrice: product!.productPrice.toString(),
                      qty: 1);

                  if (inCart) {
                    Get.snackbar(
                      "Removed Successfully",
                      "",
                      snackPosition: SnackPosition.BOTTOM,
                      duration: const Duration(seconds: 1),
                    );

                    cartController.removeProductFromCart(model);
                    UserSharedPreferences.setCartList(
                        cartController.cartProducts);
                  } else {
                    Get.snackbar(
                      "Added Successfully",
                      "",
                      snackPosition: SnackPosition.BOTTOM,
                      duration: const Duration(seconds: 1),
                    );

                    cartController.addProductToCart(model);
                    //print(cartController.cartProducts);
                    UserSharedPreferences.setCartList(
                        cartController.cartProducts);
                  }
                  setState(() {
                    inCart = !inCart;
                  });
                },
                style: ElevatedButton.styleFrom(
                    primary: primaryColor, shape: const StadiumBorder()),
                child: inCart
                    ? const Text("Remove from Cart")
                    : const Text("Add to Cart"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
