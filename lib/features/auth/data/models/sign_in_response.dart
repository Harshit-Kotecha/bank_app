class SignInResponse {
    int? id;
    String? access;
    String? username;
    String? firstName;
    String? lastName;
    String? balance;
    dynamic accountNumber;
    String? sortCode;
    String? email;
    double? expiredInHours;
    bool? alreadyExist;

    SignInResponse({
        this.id,
        this.access,
        this.username,
        this.firstName,
        this.lastName,
        this.balance,
        this.accountNumber,
        this.sortCode,
        this.email,
        this.expiredInHours,
        this.alreadyExist,
    });

    factory SignInResponse.fromJson(Map<String, dynamic> json) => SignInResponse(
        id: json["id"],
        access: json["access"],
        username: json["username"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        balance: json["balance"],
        accountNumber: json["account_number"],
        sortCode: json["sort_code"],
        email: json["email"],
        expiredInHours: json["expired_in_hours"],
        alreadyExist: json["already_exist"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "access": access,
        "username": username,
        "first_name": firstName,
        "last_name": lastName,
        "balance": balance,
        "account_number": accountNumber,
        "sort_code": sortCode,
        "email": email,
        "expired_in_hours": expiredInHours,
        "already_exist": alreadyExist,
    };
}