class ApiUrl {
  static const apiMainPath = "https://narayanmantrasadhanavigyan.org/api2/";

  static const getBannerList = "${apiMainPath}BannerList";
  static const registerApi = "${apiMainPath}userRegister";
  static const loginApi = "${apiMainPath}userLogin";
  static const galleryList = "${apiMainPath}Gallery";
  static const sadhanaListApi = "${apiMainPath}SadhanaList";
  static const pageSectionApi = "${apiMainPath}PageSection/";
  static const widgetSectionApi = "${apiMainPath}WidgetSection/";


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
