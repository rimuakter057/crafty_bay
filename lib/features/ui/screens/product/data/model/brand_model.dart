class BrandModel{
  final String id;
  final String title;
  final String slug;
  final String icon;

  BrandModel({required this.id,required this.title,required this.slug,required this.icon});

  factory BrandModel.fromJson(Map<String,dynamic>jsonData){
    return BrandModel(
        id: jsonData['_id'],
        title: jsonData['title'],
        slug: jsonData['slug'],
        icon: jsonData['icon'],
    );
  }


}

// "_id": "67c7bf6e623a876bc4766ff1",
// "title": "TUS",
// "slug": "tus",
// "icon": "https