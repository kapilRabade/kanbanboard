class RemoteDataSource {
  static const BASE_URL = 'https://api.todoist.com/rest/v2';

  // static const BASE_URL = 'https://tahcardealers.com/'; //live server
  // static const HOSTNAME = "tahcardealers.com"; //IMPORTANT.

//Driver api' s

  final String driverLogin = 'api/login';
  final String driverSignUp = 'api/register';
  final String deleteDriverAccount = 'api/driver-acc-delete';
  final String deleteAccountSurvey = 'api/driver-acc-delete-survey';
  final String deleteAccVerifyPass = 'api/driver-acc-verify-password';
  final String forgotPassApi = 'api/forgot-password';
  final String updateDriverProfile = 'api/update-profile';
  final String contactUs = 'api/contact-us';
  final String addBankAccount = 'api/bank-details';
  final String bankList = 'api/bank-list';
  final String withdrawalAmount = 'api/withdrawal';
  final String walletDetail = "api/wallet";
  final String remainingAmount = "api/wallet-money";
  final String getState = 'api/get-states';
  final String getCitie = 'api/get-city';
  final String zipCode = 'api/get-zipcode';
  final String getSearchCities = 'api/search-cities';
  final String getSearchStates = 'api/get-states';
  final String zipCodeNew = 'api/get-city-zipcode';

  // Home Screen api's
  final String getOneWayTrade = 'api/one-way-trade';
  final String getTwoWayTrade = 'api/two-way-trade';
  final String getDelieveryTrade = 'api/schedule-delivery-trade';
  final String getEnclosedDeliveryTrade = 'api/enclosed-delivery-trade';
  final String searchOneWayTrade = 'api/search-one-way-trade';
  final String searchTwoWayTrade = 'api/search-two-way-trade';
  final String searchDeliveryTrade = 'api/search-schedule-delivery-trade';
  final String searchEnclosedDeliveryTrade =
      'api/search-enclosed-delivery-trade';

  //Upload_vehicle_image api's
  final String uploadVehicleImg = 'api/upload-vehicle-image';
  final String uploadSingleVehicleImg = "api/add-vehicle-photo";

  // job
  final String jobDetails = 'api/job-details';

  final String startJob = 'api/start-job';
  final String cancelJob = "api/cancel-job";
  final String acceptedJob = 'api/accepted-job';
  final String swapTrade = "api/swap-start-job";
  final String jobSummery = "api/job-summary";
  final String jobStatus = "api/check-job-status";

  //Bills
  final String tradeBillApi = 'api/bill';
  final String swapData = "api/swap-image-note";
  final String carAllImages = "api/get-car-img-detail";

  //Notification
  final String notificationApi = 'api/job-notification';
  final String jobCountApi = 'api/job-count';

  final String tahcarEmail = "api/get-dealer-email";
  final String saveBills = "api/save-bill";
  final String saveSignatureImage = "api/get-sign-image";

  //Earning details
  final String earningDetails = "api/earning-details";
  final String recentEarnings = "api/recent-earning";

  // truckDoc
  final String uploadTruckDoc = "api/upload-documents";
  final String uploadSingleTruckDocs = "api/upload-truck-documents";
  final String documentStatus = 'api/document-status';
  final String updateDoc = "api/update-documents";
  final String updateTruckDoc = "api/update-truck-documents";


  //get pdf
  final String pdf = "api/get-pdf";

  //get vehicle color
  final String getVehicleColor = "api/vehicle-color";
  final String submitVehicleMileage = "api/update-vehicle-mileage";

  //live tracking
  final String uploadLatLong = "api/track-location";

  //generate statement on job complete
  final String generateStatementAPI = "api/statement";
  final String generateStatementAPILatest = "api/job-statement";


  //save signature to build pdf from backend
  final String saveTradeSignatureImages = "api/get-sign-image";

  //upload vehicle images new API
  final String uploadCarImages = "api/upload-car-image";


  //Kanban_board
  final String projects = "/projects";
  final String comment = "/comments";
  final String task = "/task";


}
