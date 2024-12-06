import 'dart:convert';

import 'package:flutter/material.dart';

class Employee {
    int? recNo;
    String? eid;
    String? idNo;
    String? firstName;
    String? lastName;
    String? middleName;
    String? extName;
    String? sex;
    DateTime? birthDate;
    int? tag;
    TextEditingController? controller;

    Employee({
        this.recNo,
        this.eid,
        this.idNo,
        this.firstName,
        this.lastName,
        this.middleName,
        this.extName,
        this.sex,
        this.birthDate,
        this.tag,
        this.controller,
    });

    Employee copyWith({
        int? recNo,
        String? eid,
        String? idNo,
        String? firstName,
        String? lastName,
        String? middleName,
        String? extName,
        String? sex,
        DateTime? birthDate,
        int? tag,
        TextEditingController? controller
    }) => 
        Employee(
            recNo: recNo ?? this.recNo,
            eid: eid ?? this.eid,
            idNo: idNo ?? this.idNo,
            firstName: firstName ?? this.firstName,
            lastName: lastName ?? this.lastName,
            middleName: middleName ?? this.middleName,
            extName: extName ?? this.extName,
            sex: sex ?? this.sex,
            birthDate: birthDate ?? this.birthDate,
            tag: tag ?? this.tag,
            controller: controller ?? this.controller
        );

    factory Employee.fromJson(String str) => Employee.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Employee.fromMap(Map<String, dynamic> json) => Employee(
        recNo: json["recNo"],
        eid: json["eid"],
        idNo: json["idNo"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        middleName: json["middleName"],
        extName: json["extName"],
        sex: json["sex"],
        birthDate: json["birthDate"] == null ? null : DateTime.parse(json["birthDate"]),
        tag: json["tag"],
        controller: json["controller"]
    );

    Map<String, dynamic> toMap() => {
        "recNo": recNo,
        "eid": eid,
        "idNo": idNo,
        "firstName": firstName,
        "lastName": lastName,
        "middleName": middleName,
        "extName": extName,
        "sex": sex,
        "birthDate": birthDate?.toIso8601String(),
        "tag": tag,
        "controller": controller
    };

    String fullname() => "$firstName $middleName $lastName";
}
