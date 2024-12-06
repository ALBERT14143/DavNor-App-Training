import 'package:davnor_get/app/data/account/model/employee.dart';
import 'package:davnor_get/app/data/account/model/user.dart';
import 'package:davnor_get/app/data/services/api_services.dart';
import 'package:davnor_get/app/data/services/services_config.dart';

class Repository {

  Future<User> login(String username, String password) async {
    var credentials = {
      "username": username,
      "password": password
    };
    var path = HRISConfig().getEnpoint("Auth/Login");
    var data = await ApiServices().post(path, data: credentials);
    return User.fromJson(data);
  }

  Future<List<Employee>> getEmployees(String token) async {
    var path = ServicesConfig().endpoint("tRSPEmployees");
    List<dynamic> data = await ApiServices().getDio(path, token);
    return data.map((e) => Employee.fromMap(e)).toList();
  }

  Future<Employee> saveEmployee(Employee emp) async {
    var path = ServicesConfig().endpoint("tRSPEmployees");
    var data = await ApiServices().postDio(path, data: emp.toJson());
    return Employee.fromMap(data);
  }

  Future removeEmployee(int recNo) async {
    var path = ServicesConfig().endpoint("tRSPEmployees/$recNo");
    await ApiServices().deleteDio(path);
  }
}