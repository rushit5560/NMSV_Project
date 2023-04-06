class ApiUrl {
  static const apiMainPath = "https://narayanmantrasadhanavigyan.org/api2/";

  static const getBannerList = "${apiMainPath}BannerList";
  static const registerApi = "${apiMainPath}userRegister";
  static const loginApi = "${apiMainPath}userLogin";
  static const galleryList = "${apiMainPath}Gallery";
  static const guruvaniList = "${apiMainPath}MediaSection";
  static const sadhanaListApi = "${apiMainPath}shadhanalist?order=DESCG";
  static const pageSectionApi = "${apiMainPath}PageSection/";
  static const meeToGurudevApi = "${apiMainPath}WidgetSection/";
  static const widgetSectionApi = "${apiMainPath}WidgetSection/";
  static const getBhajanListApi = "${apiMainPath}MediaSection/";
  static const galleryPhotoApi = "${apiMainPath}GalleryPhoto";
  static const galleryPlayerApi = "${apiMainPath}SingleMedia";
  static const guruvaniPlayerApi = "${apiMainPath}SingleMedia";
  static const campScheduleApi = "${apiMainPath}CampSchedule";
  static const magazineHistoryApi = "${apiMainPath}MagazineSubscibeUserList";
  static const magazinePdfDetailsApi = "${apiMainPath}Magazinepdfdetail";



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
