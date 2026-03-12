class Dummies {
  static String password = "password";
  static Map<String, dynamic> loginResponse = {
    "token": "dummy token",
    "user": userResponse
  };

  static Map<String, dynamic> userResponse = {
    "name": "test",
    "email": "test@gmail.com",
    "address": "Jalan Bunga Patih no 1 Jakarta Selatan",
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
        "image": "https://miro.medium.com/1*cWklGlA01JspimzBenSUKA.jpeg",
        "description": "Beton kokoh nan panjang",
        "harga": 200000.0,
        "category": "one"
      },
      {
        "id": 2,
        "name": "Cangkul",
        "description": "Cangkul untuk cangkul tanah",
        "image": "https://miro.medium.com/1*cWklGlA01JspimzBenSUKA.jpeg",
        "harga": 250000.0,
        "category": "two"
      },
      {
        "id": 3,
        "name": "Bendera",
        "description": "Bendera biru melambangkan lautan",
        "image": "https://miro.medium.com/1*cWklGlA01JspimzBenSUKA.jpeg",
        "harga": 20000.0,
        "category": "three"
      },
      {
        "id": 4,
        "name": "Minum",
        "description": "Minuman sehat manis dingin",
        "image": "https://miro.medium.com/1*cWklGlA01JspimzBenSUKA.jpeg",
        "harga": 2000.0,
        "category": "two"
      },
    ]
  };
}