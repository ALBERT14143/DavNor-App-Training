import 'dart:convert';

class User {
    String? eic;
    String? idNo;
    int? recNo;
    String? firstName;
    String? lastName;
    String? middleName;
    String? extName;
    String? birthdate;
    String? birthplace;
    String? fullnameFirst;
    String? fullnameLast;
    String? designation;
    String? empGroupCode;
    dynamic payGroupCode;
    String? schemeCode;
    String? officeCode;
    String? officeName;
    String? workStatus;
    String? token;
    bool? hasLeaveBenefit;

    User({
        this.eic,
        this.idNo,
        this.recNo,
        this.firstName,
        this.lastName,
        this.middleName,
        this.extName,
        this.birthdate,
        this.birthplace,
        this.fullnameFirst,
        this.fullnameLast,
        this.designation,
        this.empGroupCode,
        this.payGroupCode,
        this.schemeCode,
        this.officeCode,
        this.officeName,
        this.workStatus,
        this.token,
        this.hasLeaveBenefit,
    });

    User copyWith({
        String? eic,
        String? idNo,
        int? recNo,
        String? firstName,
        String? lastName,
        String? middleName,
        String? extName,
        String? birthdate,
        String? birthplace,
        String? fullnameFirst,
        String? fullnameLast,
        String? designation,
        String? empGroupCode,
        dynamic payGroupCode,
        String? schemeCode,
        String? officeCode,
        String? officeName,
        String? workStatus,
        String? token,
        bool? hasLeaveBenefit,
    }) => 
        User(
            eic: eic ?? this.eic,
            idNo: idNo ?? this.idNo,
            recNo: recNo ?? this.recNo,
            firstName: firstName ?? this.firstName,
            lastName: lastName ?? this.lastName,
            middleName: middleName ?? this.middleName,
            extName: extName ?? this.extName,
            birthdate: birthdate ?? this.birthdate,
            birthplace: birthplace ?? this.birthplace,
            fullnameFirst: fullnameFirst ?? this.fullnameFirst,
            fullnameLast: fullnameLast ?? this.fullnameLast,
            designation: designation ?? this.designation,
            empGroupCode: empGroupCode ?? this.empGroupCode,
            payGroupCode: payGroupCode ?? this.payGroupCode,
            schemeCode: schemeCode ?? this.schemeCode,
            officeCode: officeCode ?? this.officeCode,
            officeName: officeName ?? this.officeName,
            workStatus: workStatus ?? this.workStatus,
            token: token ?? this.token,
            hasLeaveBenefit: hasLeaveBenefit ?? this.hasLeaveBenefit,
        );

    factory User.fromJson(String str) => User.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory User.fromMap(Map<String, dynamic> json) => User(
        eic: json["eic"],
        idNo: json["idNo"],
        recNo: json["recNo"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        middleName: json["middleName"],
        extName: json["extName"],
        birthdate: json["birthdate"],
        birthplace: json["birthplace"],
        fullnameFirst: json["fullnameFirst"],
        fullnameLast: json["fullnameLast"],
        designation: json["designation"],
        empGroupCode: json["empGroupCode"],
        payGroupCode: json["payGroupCode"],
        schemeCode: json["schemeCode"],
        officeCode: json["officeCode"],
        officeName: json["officeName"],
        workStatus: json["workStatus"],
        token: json["token"],
        hasLeaveBenefit: json["hasLeaveBenefit"],
    );

    Map<String, dynamic> toMap() => {
        "eic": eic,
        "idNo": idNo,
        "recNo": recNo,
        "firstName": firstName,
        "lastName": lastName,
        "middleName": middleName,
        "extName": extName,
        "birthdate": birthdate,
        "birthplace": birthplace,
        "fullnameFirst": fullnameFirst,
        "fullnameLast": fullnameLast,
        "designation": designation,
        "empGroupCode": empGroupCode,
        "payGroupCode": payGroupCode,
        "schemeCode": schemeCode,
        "officeCode": officeCode,
        "officeName": officeName,
        "workStatus": workStatus,
        "token": token,
        "hasLeaveBenefit": hasLeaveBenefit,
    };
}
