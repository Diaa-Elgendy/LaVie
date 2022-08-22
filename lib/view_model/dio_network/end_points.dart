class EndPoint {

  static const String baseUrl = 'https://lavie.orangedigitalcenteregypt.com';

  //Authorize
  static const String login = '/api/v1/auth/signin';
  static const String signUp = '/api/v1/auth/signup';
  static const String forgetPassword = '/api/v1/auth/forget-password';
  static const String verifyOTP = '/api/v1/auth/verify-otp';
  static const String resetPassword = '/api/v1/auth/reset-password';


  //Home
  static const String getProducts = '/api/v1/products';
  static const String getPlants = '/api/v1/plants';
  static const String getSeeds = '/api/v1/seeds';
  static const String getTools = '/api/v1/tools';

  //User profile
  static const String getCurrentUser = '/api/v1/user/me';
  static const String updateCurrentUser = '/api/v1/user/me';

  //Blogs
  static const String getBlogs = '/api/v1/products/blogs';

  //Forums
  static const String createNewPost = '/api/v1/forums';
  static const String getAllForums = '/api/v1/forums/me';
  static const String getMyForums = '/api/v1/forums';
  static const String getForumByTitle = '/api/v1/forums';
}
