class ServicesConfig {
  var local_host = "https://172.16.188.48";
  var live_host = "https://172.16.188.48";
  var isLive = false;

  String endpoint(String path) {
    return isLive ? "$live_host/awesomenessApi/api/$path" : "$local_host/awesomenessApi/api/$path";
  }
}

class HRISConfig{
  var local_host = "https://davnorsystems.gov.ph";
  var live_host = "https://davnorsystems.gov.ph";
  // /api/Auth/Login
  var isLive = false;

  String getEnpoint(String path) {
    return isLive ? "$live_host/HRISMobileApi/api/$path" : "$local_host/HRISMobileApi/api/$path";
  }
}