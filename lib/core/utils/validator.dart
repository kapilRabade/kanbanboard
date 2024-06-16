
import 'dart:async';

import 'package:get/get.dart';

class Validator{

  final StreamTransformer<String, String> validateEmail =
  StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    String? result = checkEmail(email);
    if (result == null) {
      sink.add(email);
    } else {
      sink.addError(result);
    }
  });


  static String? checkEmail(String value) {
    //final RegExp emailExp = RegExp(_kEmailRule);
    //if (value == null || value.isEmpty || !emailExp.hasMatch(value)) {
    if (GetUtils.isEmail(value)) {
      return null;
    } else {
      return 'A valid email address is required.';
    }
  }


  final validatePassword =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    String? result = checkPassword(value);
    if (result == null) {
      sink.add(value);
    } else {
      sink.addError(result);
    }
  });

  static String? checkPassword(String value) {
    //final RegExp passwordExp = new RegExp(_kMin8CharsOneLetterOneNumber);
    if (value == null || value.isEmpty) {
      return 'Enter a valid password';
    } else if (value != null && value.length < 6) {
      return 'Password must be 6 character long';
    } else {
      return null;
    }
  }

  final validateAmount =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    String? result = checkAmount(value);
    if (result == null) {
      sink.add(value);
    } else {
      sink.addError(result);
    }
  });

  static String? checkAmount(String value) {
    //final RegExp passwordExp = new RegExp(_kMin8CharsOneLetterOneNumber);
    if (value == null || value.isEmpty) {
      return 'Enter a valid amount';
    } else {
      return null;
    }
  }

  final validateConfirmPassword =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    String? result = checkConfirmPassword(value);
    if (result == null) {
      sink.add(value);
    } else {
      sink.addError(result);
    }
  });

  static String? checkConfirmPassword(String value) {
    //final RegExp passwordExp = new RegExp(_kMin8CharsOneLetterOneNumber);
    if (value == null || value.isEmpty) {
      return 'Enter a confirm password';
    } else if (value != null && value.length < 6) {
      return 'Confirm Password must be 6 character long';
    } else {
      return null;
    }
  }

  final validName =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    String? result = checkName(value);
    if (result == null) {
      sink.add(value);
    } else {
      sink.addError(result);
    }
  });

  static String? checkName(String value) {
    if (value == null || value.isEmpty) {
      return 'Enter name';
    } else {
      return null;
    }
  }

  final validFirstName =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    String? result = checkFirstName(value);
    if (result == null) {
      sink.add(value);
    } else {
      sink.addError(result);
    }
  });

  static String? checkFirstName(String value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter First name';
    } else {
      return null;
    }
  }

  final validateLastName =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    String? result = checkLastName(value);
    if (result == null) {
      sink.add(value);
    } else {
      sink.addError(result);
    }
  });

  static String? checkLastName(String value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter last name';
    } else {
      return null;
    }
  }

  final validPhoneNum =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    String? result = checkPhoneNumber(value);
    if (result == null) {
      sink.add(value);
    } else {
      sink.addError(result);
    }
  });

  static String? checkPhoneNumber(String value) {
    if (value == null || value.isEmpty) {
      return 'Enter Phone Number';
    } else if (value != null && value.length < 10) {
      return 'Phone Number must be 10 character long';
    } else {
      return null;
    }
  }

  final validateZipCode =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    String? result = checkZipCode(value);
    if (result == null) {
      sink.add(value);
    } else {
      sink.addError(result);
    }
  });

  static String? checkZipCode(String value) {
    if (value == null || value.isEmpty) {
      return 'Enter Zip Code';
    } else if (value != null && value.length < 5) {
      return 'Zip Code must be 5 character long';
    } else {
      return null;
    }
  }

  final validateDob =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    String? result = checkDOB(value);
    if (result == null) {
      sink.add(value);
    } else {
      sink.addError(result);
    }
  });

  static String? checkDOB(String value) {
    if (value == null || value.isEmpty) {
      return 'Enter Date Of Birth ';
    } else {
      return null;
    }
  }

  final validateGender =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    String? result = checkGender(value);
    if (result == null) {
      sink.add(value);
    } else {
      sink.addError(result);
    }
  });

  static String? checkGender(String value) {
    if (value == null || value.isEmpty) {
      return 'Enter Gender';
    } else {
      return null;
    }
  }


  final validatUserImage =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    String? result = checkUserImage(value);
    if (result == null) {
      sink.add(value);
    } else {
      sink.addError(result);
    }
  });

  static String? checkUserImage(String value) {
    if (value == null || value.isEmpty) {
      return 'Submit User Image';
    } else {
      return null;
    }
  }


  final validateMessage =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    String? result = checkMessage(value);
    if (result == null) {
      sink.add(value);
    } else {
      sink.addError(result);
    }
  });

  static String? checkMessage(String value) {
    if (value == null || value.isEmpty) {
      return 'Enter Message';
    } else {
      return null;
    }
  }


  final validateBankName =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    String? result = checkBankName(value);
    if (result == null) {
      sink.add(value);
    } else {
      sink.addError(result);
    }
  });

  static String? checkBankName(String value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Bank Name';
    } else {
      return null;
    }
  }
  final validateAccNo =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    String? result = checkAccNo(value);
    if (result == null) {
      sink.add(value);
    } else {
      sink.addError(result);
    }
  });

  static String? checkAccNo(String value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Account Number';
    } else if (value != null && value.length < 10) {
      return 'Account Number must be 10 character long';
    }
    else {
      return null;
    }
  }

  final validateConfirmAccNo =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    String? result = checkConfirmAccNo(value);
    if (result == null) {
      sink.add(value);
    } else {
      sink.addError(result);
    }
  });

  static String? checkConfirmAccNo(String value) {
    if (value == null || value.isEmpty) {
      return 'Please Confirm Account Number';
    } else {
      return null;
    }
  }

  final validateIfscCode =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    String? result = checkIfscCode(value);
    if (result == null) {
      sink.add(value);
    } else {
      sink.addError(result);
    }
  });

  static String? checkIfscCode(String value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter IFSC Code';
    } else {
      return null;
    }
  }


  final validateBranchName =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    String? result = checkBranchName(value);
    if (result == null) {
      sink.add(value);
    } else {
      sink.addError(result);
    }
  });

  static String? checkBranchName(String value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Branch Name';
    } else {
      return null;
    }
  }

  final validatExtraImage =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    String? result = checkfrontImage(value);
    if (result == null) {
      sink.add(value);
    } else {
      sink.addError(result);
    }
  });

  static String? checkExtraImage(String value) {
    if (value == null || value.isEmpty) {
      return 'Submit Image';
    } else {
      return null;
    }
  }


  final validatfrontImage =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    String? result = checkfrontImage(value);
    if (result == null) {
      sink.add(value);
    } else {
      sink.addError(result);
    }
  });

  static String? checkfrontImage(String value) {
    if (value == null || value.isEmpty) {
      return 'Submit Front Image';
    } else {
      return null;
    }
  }
  final validatRearImage =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    String? result = checkRearImage(value);
    if (result == null) {
      sink.add(value);
    } else {
      sink.addError(result);
    }
  });

  static String? checkRearImage(String value) {
    if (value == null || value.isEmpty) {
      return 'Submit Rear Image';
    } else {
      return null;
    }
  }
  final validatLeftImage =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    String? result = checkLeftImage(value);
    if (result == null) {
      sink.add(value);
    } else {
      sink.addError(result);
    }
  });

  static String? checkLeftImage(String value) {
    if (value == null || value.isEmpty) {
      return 'Submit Left Image';
    } else {
      return null;
    }
  }
  final validatRightImage =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    String? result = checkRightImage(value);
    if (result == null) {
      sink.add(value);
    } else {
      sink.addError(result);
    }
  });

  static String? checkRightImage(String value) {
    if (value == null || value.isEmpty) {
      return 'Submit Right Image';
    } else {
      return null;
    }
  }
  final validateFrontWindImage =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    String? result = checkFrontWindImage(value);
    if (result == null) {
      sink.add(value);
    } else {
      sink.addError(result);
    }
  });

  static String? checkFrontWindImage(String value) {
    if (value == null || value.isEmpty) {
      return 'Submit FrontWindShield Image';
    } else {
      return null;
    }
  }
  final validatRearWindShieldImage =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    String? result = checkUserImage(value);
    if (result == null) {
      sink.add(value);
    } else {
      sink.addError(result);
    }
  });

  static String? checkRearWindImage(String value) {
    if (value == null || value.isEmpty) {
      return 'Submit RearWindShield Image';
    } else {
      return null;
    }
  }

  final validSsNumber =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    String? result = checkSsNumber(value);
    if (result == null) {
      sink.add(value);
    } else {
      sink.addError(result);
    }
  });

  static String? checkSsNumber(String value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Social Security Number';
    } else {
      return null;
    }
  }

  final validW9Doc=
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    String? result = checkW9Doc(value);
    if (result == null) {
      sink.add(value);
    } else {
      sink.addError(result);
    }
  });

  static String? checkW9Doc(String value) {
    if (value == null || value.isEmpty) {
      return 'Please submit W-9';
    } else {
      return null;
    }

  }


  final validLicenseFront=
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    String? result = checkLicenseFront(value);
    if (result == null) {
      sink.add(value);
    } else {
      sink.addError(result);
    }
  });

  static String? checkLicenseFront(String value) {
    if (value == null || value.isEmpty) {
      return 'Please submit Driving License Front';
    } else {
      return null;
    }

  }
  final validLicenseBack=
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    String? result = checkLicenseBack(value);
    if (result == null) {
      sink.add(value);
    } else {
      sink.addError(result);
    }
  });

  static String? checkLicenseBack(String value) {
    if (value == null || value.isEmpty) {
      return 'Please submit Driving License Back';
    } else {
      return null;
    }
  }

  final validateInspectionReport=
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    String? result = checkInspectionReport(value);
    if (result == null) {
      sink.add(value);
    } else {
      sink.addError(result);
    }
  });

  static String? checkInspectionReport(String value) {
    if (value == null || value.isEmpty) {
      return 'Please Submit Truck Inspection Report';
    } else {
      return null;
    }
  }

  final validateTruckRegistration=
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    String? result = checkTruckRegistration(value);
    if (result == null) {
      sink.add(value);
    } else {
      sink.addError(result);
    }
  });

  static String? checkTruckRegistration(String value) {
    if (value == null || value.isEmpty) {
      return 'Please Submit Truck Registration';
    } else {
      return null;
    }
  }
  final validateInsuranceCopy=
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    String? result = checkInsuranceCopy(value);
    if (result == null) {
      sink.add(value);
    } else {
      sink.addError(result);
    }
  });

  static String? checkInsuranceCopy(String value) {
    if (value == null || value.isEmpty) {
      return 'Please Submit Insurance copy';
    } else {
      return null;
    }
  }
  final validateUsDotNumber=
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    String? result = checkUsDotNumber(value);
    if (result == null) {
      sink.add(value);
    } else {
      sink.addError(result);
    }
  });

  static String? checkUsDotNumber(String value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter USDOT Number';
    } else {
      return null;
    }
  }
  final validateMcNumber=
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    String? result = checkMcNumber(value);
    if (result == null) {
      sink.add(value);
    } else {
      sink.addError(result);
    }
  });

  static String? checkMcNumber(String value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter MC Number';
    } else {
      return null;
    }
  }

  final validateTruckName=
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    String? result = checkTruckName(value);
    if (result == null) {
      sink.add(value);
    } else {
      sink.addError(result);
    }
  });

  static String? checkTruckName(String value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter TruckName';
    } else {
      return null;
    }
  }

}