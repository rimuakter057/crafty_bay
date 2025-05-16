import 'package:crafty_bay/app/app_urls.dart';
import 'package:crafty_bay/core/network_caller/network_caller.dart';
import 'package:crafty_bay/features/ui/common/model/category_model.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController{
  final int _perPageDataCount=10;
  int _currentPage=0;
  int? _totalPage;
  bool _isInitialLoading=true;
  bool _isLoadMoreInProgress=false;
 List <CategoryModel> _categoryList=[];
 String? _errorMessage;
 String? get errorMessage => _errorMessage;
 int? get totalPage => _totalPage;
 List <CategoryModel> get categoryList => _categoryList;
 bool get isInitialLoading => _isInitialLoading;
  bool get isLoadMoreInProgress => _isLoadMoreInProgress;

  Future<bool> getCategoryList()async{
    if (_totalPage != null && _currentPage > _totalPage!) {
      return true;
    }
            bool isSuccess=false;
       _currentPage++;

    if(!_isInitialLoading){
      _isLoadMoreInProgress=true;
    }
    update();
       final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
           url: AppUrls.categoryList,
       queryParams: {
             'count':_perPageDataCount,
         'page':_currentPage,
       }
       );

       if(response.isSuccess){
         List <CategoryModel> list =[];
         for(Map<String,dynamic> data in response.responseData!['data']['results']){
           list.add(CategoryModel.fromJson(data));
         }
         _categoryList.addAll(list);
         _totalPage=response.responseData!['data']['last_page'];
         _errorMessage=null;
      isSuccess=true;
       }
       else{
         _errorMessage=response.errorMessage;
       }

       if(!_isInitialLoading){
         _isLoadMoreInProgress=false;
       }else{
         _isInitialLoading=false;
       }
       update();
return isSuccess;
  }


 Future<bool>  refreshList(){
    _currentPage=0;
    _categoryList=[];
    _isInitialLoading=true;
    return getCategoryList();

  }


}

/////end===============================


