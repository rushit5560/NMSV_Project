import 'dart:convert';

MagazineListModel magazineListModelFromJson(String str) => MagazineListModel.fromJson(json.decode(str));

String magazineListModelToJson(MagazineListModel data) => json.encode(data.toJson());

class MagazineListModel {
  MagazineListModel({
    required this.status,
    required this.data,
    required this.expireStatus,
  });

  String status;
  List<MagazineData> data;
  String expireStatus;

  factory MagazineListModel.fromJson(Map<String, dynamic> json) => MagazineListModel(
    status: json["status"] ?? "",
    data: List<MagazineData>.from((json["data"] ?? []).map((x) => MagazineData.fromJson(x ?? {}))),
    expireStatus: json["expireStatus"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "expireStatus": expireStatus,
  };
}

class MagazineData {
  MagazineData({
    required this.address,
    required this.city,
    required this.country,
    required this.createdOn,
    required this.date,
    required this.emailId,
    required this.expiryDate,
    required this.firstName,
    required this.id,
    required this.ip,
    required this.isActive,
    required this.lastName,
    required this.magazineType,
    required this.phone,
    required this.postalCode,
    required this.state,
    required this.streetAddress,
    required this.tempCode,
    required this.userId,
    required this.pdf,
  });

  String address;
  String city;
  String country;
  String createdOn;
  String date;
  String emailId;
  String expiryDate;
  String firstName;
  String id;
  String ip;
  String isActive;
  String lastName;
  String magazineType;
  String phone;
  String postalCode;
  String state;
  String streetAddress;
  String tempCode;
  String userId;
  List<MagazinePdf> pdf;

  factory MagazineData.fromJson(Map<String, dynamic> json) => MagazineData(
    address: json["Address"] ?? "",
    city: json["City"] ?? "",
    country: json["Country"] ?? "",
    createdOn: json["CreatedOn"] ?? "",
    date: json["Date"] ?? "",
    emailId: json["EmailID"] ?? "",
    expiryDate: json["ExpiryDate"] ?? "",
    firstName: json["FirstName"] ?? "",
    id: json["ID"] ?? "",
    ip: json["IP"] ?? "",
    isActive: json["IsActive"] ?? "",
    lastName: json["LastName"] ?? "",
    magazineType: json["MagazineType"] ?? "",
    phone: json["Phone"] ?? "",
    postalCode: json["PostalCode"] ?? "",
    state: json["State"] ?? "",
    streetAddress: json["StreetAddress"] ?? "",
    tempCode: json["TempCode"] ?? "",
    userId: json["UserID"] ?? "",
    pdf: List<MagazinePdf>.from((json["pdf"] ?? []).map((x) => MagazinePdf.fromJson(x ?? {}))),
  );

  Map<String, dynamic> toJson() => {
    "Address": address,
    "City": city,
    "Country": country,
    "CreatedOn": createdOn,
    "Date": date,
    "EmailID": emailId,
    "ExpiryDate": expiryDate,
    "FirstName": firstName,
    "ID": id,
    "IP": ip,
    "IsActive": isActive,
    "LastName": lastName,
    "MagazineType": magazineType,
    "Phone": phone,
    "PostalCode": postalCode,
    "State": state,
    "StreetAddress": streetAddress,
    "TempCode": tempCode,
    "UserID": userId,
    "pdf": List<dynamic>.from(pdf.map((x) => x.toJson())),
  };
}

class MagazinePdf {
  MagazinePdf({
    required this.magazinepdfId,
    required this.magazinepdfTitle,
    required this.month,
    required this.year,
    required this.date,
    required this.pdfFile,
    required this.image,
    required this.archiveId,
    required this.tempCode,
    required this.isActive,
    required this.createdOn,
    // this.modifiedOn,
    required this.createdBy,
    required this.pdfurl,
    required this.imageurl,
  });

  String magazinepdfId;
  String magazinepdfTitle;
  String month;
  String year;
  DateTime date;
  String pdfFile;
  String image;
  String archiveId;
  String tempCode;
  String isActive;
  DateTime createdOn;
  // dynamic modifiedOn;
  String createdBy;
  String pdfurl;
  String imageurl;

  factory MagazinePdf.fromJson(Map<String, dynamic> json) => MagazinePdf(
    magazinepdfId: json["MagazinepdfID"] ?? "",
    magazinepdfTitle: json["MagazinepdfTitle"] ?? "",
    month: json["Month"] ?? "",
    year: json["Year"] ?? "",
    date: DateTime.parse(json["Date"] ?? DateTime.now()),
    pdfFile: json["PdfFile"] ?? "",
    image: json["Image"] ?? "",
    archiveId: json["ArchiveID"] ?? "",
    tempCode: json["TempCode"] ?? "",
    isActive: json["IsActive"] ?? "",
    createdOn: DateTime.parse(json["CreatedOn"] ?? DateTime.now()),
    // modifiedOn: json["ModifiedOn"],
    createdBy: json["CreatedBy"] ?? "",
    pdfurl: json["pdfurl"] ?? "",
    imageurl: json["imageurl"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "MagazinepdfID": magazinepdfId,
    "MagazinepdfTitle": magazinepdfTitle,
    "Month": month,
    "Year": year,
    "Date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "PdfFile": pdfFile,
    "Image": image,
    "ArchiveID": archiveId,
    "TempCode": tempCode,
    "IsActive": isActive,
    "CreatedOn": createdOn.toIso8601String(),
    // "ModifiedOn": modifiedOn,
    "CreatedBy": createdBy,
    "pdfurl": pdfurl,
    "imageurl": imageurl,
  };
}

