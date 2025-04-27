



class SliderModel{
  final String id;
  final String photoUrl;
  final String description;
  final String brand;
  final String category;


  SliderModel({required this.id,
    required this.photoUrl,
    required this.description,
    required this.brand,
    required this.category,
  });

  factory SliderModel.fromJson(Map<String,dynamic>jsonData){
    return SliderModel(id: jsonData['_id'],
        photoUrl: jsonData['photo_url'],
        description: jsonData['description'],
        brand: jsonData['brand'],
        category: jsonData['category']);

  }

  Map <String,dynamic> toJson(){
    return{
      '_id':id,
      'photo_url':photoUrl,
      'description':description,
      'brand':brand,
      'category':category,
    };
  }
}



















// "_id": "680d16ca408c2a3e015a83b0",
// "photo_url": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbpR5UwmiL1npP790Q-3rPsAm18AMvUk180ixGC44Kwy-eCMC_OwE15SpK3PHSeqRuTqk&usqp=CAU",
// "description": "Iphone 16 pro",
// "product": null,
// "brand": "679a05182b11cd5ff18023e9",
// "category": null,
// "createdAt": "2025-04-26T17:24:26.803Z",
// "updatedAt": "2025-04-26T17:24:26.803Z",
// "__v": 0
