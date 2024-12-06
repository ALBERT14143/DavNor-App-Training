import 'dart:convert';

class Employee {
    List<User>? users;

    Employee({
        this.users,
    });

    Employee copyWith({
        List<User>? users,
    }) => 
        Employee(
            users: users ?? this.users,
        );

    factory Employee.fromJson(String str) => Employee.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Employee.fromMap(Map<String, dynamic> json) => Employee(
        users: json["users"] == null ? [] : List<User>.from(json["users"]!.map((x) => User.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "users": users == null ? [] : List<dynamic>.from(users!.map((x) => x.toMap())),
    };
}

class User {
    int? id;
    String? firstName;
    String? lastName;
    String? maidenName;

    User({
        this.id,
        this.firstName,
        this.lastName,
        this.maidenName,
    });

    User copyWith({
        int? id,
        String? firstName,
        String? lastName,
        String? maidenName,
    }) => 
        User(
            id: id ?? this.id,
            firstName: firstName ?? this.firstName,
            lastName: lastName ?? this.lastName,
            maidenName: maidenName ?? this.maidenName,
        );

    factory User.fromJson(String str) => User.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        maidenName: json["maidenName"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "maidenName": maidenName,
    };
}
