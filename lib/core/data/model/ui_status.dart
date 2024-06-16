class UIStatus {
  bool isOnScreenLoading;
  bool? isDialogLoading;
  String successWithAlertMessage;
  String successWithoutAlertMessage;
  String failureWithAlertMessage;
  String failureWithoutAlertMessage;
  String otpSentSuccessfully;
  String otpSentFailure;
  String otpVerifySuccess;
  String otpVerifyFailure;

  UIStatus(
      {this.isOnScreenLoading = false,
        this.isDialogLoading,
        this.successWithAlertMessage = '',
        this.successWithoutAlertMessage = '',
        this.failureWithAlertMessage = '',
        this.otpSentSuccessfully = '',
        this.otpSentFailure = '',
        this.otpVerifySuccess = '',
        this.otpVerifyFailure = '',
        this.failureWithoutAlertMessage = ''});
}
