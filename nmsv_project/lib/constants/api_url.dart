class ApiUrl {
  static const apiMainPath = "https://narayanmantrasadhanavigyan.org/";

  static const getBannerList = "${apiMainPath}api/BannerList";
}

class ApiHeader {
  // UserDetails userDetails = UserDetails();

  Map<String, String> apiHeader() {
    Map<String, String> header = <String, String>{
      'Authorization-Token': 'nmsvtoken'
    };

    return header;
  }
}
