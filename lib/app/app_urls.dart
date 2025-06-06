
class AppUrls{
  static const String _baseUrl = "https://ecom-rs8e.onrender.com/api";
  static const String signUp = "$_baseUrl/auth/signup";
  static const String verifyOtp = "$_baseUrl/auth/verify-otp";
  static const String signIn = "$_baseUrl/auth/login";
  static const String slider = "$_baseUrl/slides";
  static const String categoryList = "$_baseUrl/categories";
  static const String productList = "$_baseUrl/products";
  static const String cartListUrl = "$_baseUrl/cart";
  static String cardById(String id) => '$_baseUrl/cart/$id';
 static const String brandListUrl = "$_baseUrl/brands";
  static  String brandsRead(String brandId) => "$_baseUrl/brands/$brandId";
  static const String wishlist = '$_baseUrl/wishlist';
  static String reviewList = '$_baseUrl/reviews';
  static String review = '$_baseUrl/review';
static  String productDetails(String productId) => "$_baseUrl/products/id/$productId";
 static String deleteFromCartListUrl(String id) => '$_baseUrl/cart/$id';
}