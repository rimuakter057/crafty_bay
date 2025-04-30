class CategoryModel{
  final String id,title,slug,description,icon;

  CategoryModel({
    required this.id,
    required this.title,
    required this.slug,
    required this.description,
    required this.icon,

  });

  factory CategoryModel.fromJson(Map<String,dynamic>jsonData){
    return CategoryModel(id: jsonData['_id'],
        title: jsonData['title'],
        slug: jsonData['slug'],
        description: jsonData['description'],
        icon: jsonData['icon'],
    );
  }


  Map<String,dynamic> toJson(){
    return{
      '_id':id,
      'title':title,
      'slug':slug,
      'description':description,
      'icon':icon,

    };
  }



}




// "_id": "680d1b45408c2a3e015a83de",
// "title": "Books",
// "slug": "books",
// "description": "cat description",
// "icon": "https://cdn-icons-png.flaticon.com/128/5832/5832416.png",
// "parent": null,
// "createdAt": "2025-04-26T17:43:33.557Z",
// "updatedAt": "2025-04-26T17:43:33.557Z",
// "__v": 0