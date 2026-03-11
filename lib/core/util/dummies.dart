class Dummies {
  static Map<String, dynamic> loginResponse = {
    "token": "dummy token",
    "user": userResponse
  };

  static Map<String, dynamic> userResponse = {
    "name": "John Anserdon",
    "email": "john.anserdon@gmail.com",
    "id": 1
  };

  // final String id;
  // final String name;
  // final String image;
  // final String description;
  // final double harga;
  // final ProductCategory category;

  static Map<String, dynamic> productsResponse = {
    "data": [
      {
        "id": 1,
        "name": "Beton",
        "image": "https://dummy.jpg",
        "description": "Beton kokoh nan panjang",
        "harga": 200000.0,
        "category": "one"
      },
      {
        "id": 2,
        "name": "Cangkul",
        "image": "https://dummy.jpg",
        "description": "Cangkul untuk cangkul tanah",
        "harga": 250000.0,
        "category": "two"
      },
      {
        "id": 3,
        "name": "Bendera",
        "image": "https://dummy.jpg",
        "description": "Bendera biru melambangkan lautan",
        "harga": 20000.0,
        "category": "three"
      },
      {
        "id": 3,
        "name": "Minum",
        "image": "https://dummy.jpg",
        "description": "Minuman sehat manis dingin",
        "harga": 2000.0,
        "category": "two"
      },
    ]
  };
}