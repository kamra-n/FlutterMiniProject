import 'package:miniproject/constant/app_images.dart';

class Applist {
  static List<Map<String, dynamic>> groceryList = [
    {
      'item_id': 1,
      "item_name": "Apples",
      "item_price": 5,
      "item_description": "Fresh and juicy apples.",
      "item_image": [
        AppImages.appleImage,
        AppImages.orangeImage,
        AppImages.appleImage
      ],
      "item_category": "Fruits",
      "item_qty": 1
    },
    {
      'item_id': 2,
      "item_name": "oranges",
      "item_price": 5,
      "item_description": "Fresh and juicy oranges",
      "item_image": [
        AppImages.appleImage,
        AppImages.orangeImage,
        AppImages.appleImage
      ],
      "item_category": "Fruits",
      "item_qty": 1
    },
    {
      'item_id': 3,
      "item_name": "Apples",
      "item_price": 5,
      "item_description": "Fresh and juicy apples.",
      "item_image": [
        AppImages.appleImage,
        AppImages.orangeImage,
        AppImages.appleImage
      ],
      "item_category": "Masale",
      "item_qty": 1
    },
    {
      'item_id': 4,
      "item_name": "oranges",
      "item_price": 5,
      "item_description": "Fresh and juicy oranges",
      "item_image": [
        AppImages.appleImage,
        AppImages.orangeImage,
        AppImages.appleImage
      ],
      "item_category": "Masale",
      "item_qty": 1
    },
    {
      'item_id': 5,
      "item_name": "Apples",
      "item_price": 5,
      "item_description": "Fresh and juicy apples.",
      "item_image": [
        AppImages.appleImage,
        AppImages.orangeImage,
        AppImages.appleImage
      ],
      "item_category": "Vegetable",
      "item_qty": 1
    },
    {
      'item_id': 6,
      "item_name": "oranges",
      "item_price": 5,
      "item_description": "Fresh and juicy oranges",
      "item_image": [
        AppImages.appleImage,
        AppImages.orangeImage,
        AppImages.appleImage
      ],
      "item_category": "Vegetable",
      "item_qty": 1
    },
    {
      'item_id': 7,
      "item_name": "Sabzi hai",
      "item_price": 5,
      "item_description": "Fresh and juicy oranges",
      "item_image": [
        AppImages.appleImage,
        AppImages.orangeImage,
        AppImages.appleImage
      ],
      "item_category": "Vegetable",
      "item_qty": 1
    },
  ];

  static List cartItem = [];
}
