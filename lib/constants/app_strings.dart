import 'package:get/get.dart';

abstract class AppStrings {
  static String localized(String key) {
    return key.tr;
  }

  static String radio = 'RADIO';
  static String checkBox = 'CHECKBOX';
  static String input = 'INPUT';
  static int statusCodeSoftUpdate = 1220;
  static int statusCodeHardUpdate = 1200;

  static String poppinsFont = 'Poppins';
  static String get welcome => localized('Welcome');
  static String get myProfile => localized('My Profile');

  static String get loginCreateAccount => localized('Login/Create account');
  static String get minimum => localized('Minimum');
  static String get maximum => localized('Maximum');
  static String get phoneNo10Digit =>
      localized("Phone number should be 10 digits");
  static String get allowedValueIs => localized('allowed value is');
  static String get allowed => localized('allowed');
  static String get requiredString => localized('required');
  static String get lines => localized('lines');

  static String get chooseLanguage => localized('Choose language / भाषा चुनें');

  static String get english => localized('English');

  static String get hindi => localized('हिंदी');

  static String get enterMobileNumber =>
      localized("Please enter your mobile number");

  static String get continueText => localized('Continue');

  static String get privacyPolicy => localized('Privacy Policy');
  static String get externalStoragePermissionDenied =>
      localized('Please give permission for app storage access');

  static String get mobileNumber => localized('Mobile number');

  static String get haryanaAQ => localized('Haryana AQ');

  static String get otpNotReceived => localized('OTP not received?');

  static String get resendOTP => localized('Resend OTP');

  static String get inSecs => localized('in secs');

  static String get otpMatchedSuccessfully =>
      localized('Otp Matched Successfully');

  static String get otpDoesntMatch =>
      localized('OTP doesn’t match. Please check.');

  static String get enterOTP => localized('Enter OTP');

  static String get enterOtpMessage =>
      localized('Please enter the OTP sent on your mobile number');

  static String get change => localized('Change');

  static String get changePhoto => localized('Change Photo');

  static String get cameraAccessDenied => localized('Camera Access Denied');

  static String get complaints => localized('Complaints in my area');

  static String get nearByComplaint => localized('Nearby Complaints');

  static String get myComplaints => localized('My Complaints');

  static String get moreOption => localized('More Options');

  static String get location => localized('Location');

  static String get photos => localized('Photos');

  static String get phoneCalls => localized('Phone calls');

  static String get microphone => localized('Microphone');

  static String get permissionsTitle =>
      localized('We will need the following permissions');

  static String get permissionsMessage => localized(
        "To file a complaint, we'll only request the necessary permissions when needed",
      );

  static String get emailID => localized('Email ID');

  static String get yourFullName => localized('Your full name');

  static String get requiredFields => localized('Required fields');

  static String get fillDetails =>
      localized('Please fill following details to complete your profile');

  static String get completeProfile => localized('Complete your profile');

  static String get upvote => localized('Upvote');

  // 24 Aug
  static String get complaintId => localized('Complaint ID :');

  static String get pleaseEnterAValidEmail =>
      localized('Please Enter a Valid Email');

  static String get choosePreferredLanguage =>
      localized('Choose preferred language');

  static String get error => localized('Error');

  static String get nodalOfficer => localized('Nodal Officer');

  // 31 Aug
  static String get assignedStatus => localized(
        'Your complaint has been assigned to Pollution department for further action',
      );

  static String get escalatedStatus => localized(
        'We apologise for the delay in resolution. Your complaint has been escalated',
      );

  static String get viewActionTaken => localized('View action taken');

  static String get satisifiedWithAction =>
      localized('Are you satisfied with the action taken?');

  static String get shareFeedback => localized('Share Feedback');

  static String get complaint => localized('Complaint');

  // 3 Aug
  static String get experienceResolution =>
      localized('How is your experience with the resolution?');

  static String get submit => localized('Submit');

  static String get tellUsWhatYouLikedAboutUs =>
      localized('Tell us what you liked about us');

  static String get pleaseDescribe => localized('Please describe');

  static String get next => localized('Next');

  //28 Aug
  static String get editProfile => localized('Edit profile');

  static String get deleteMyAccount => localized('Delete my account');

  static String get logout => localized('Logout');

  static String get moreOptions => localized('More options');

  static String get save => localized('Save');

  static String get pleaseConfirm => localized('Please confirm');

  static String get confirmDeletion => localized(
        'Are you sure you want to delete your account? Please note that all your complaints will be permanently removed from the system.',
      );

  static String get no => localized('No');

  static String get yes => localized('Yes');

  // new
  static String get raiseComplaintHeader => localized('Raise a complaint');

  static String get complainType => localized('Complaint Type');

  static String get district => localized('District');

  static String get description => localized('Description');

  static String get addPhotoVideos => localized('Add photos/videos');

  static String get complaintReviewedText => localized(
        'Your complaint will be reviewed to ensure it adheres to our guidelines',
      );

  static String get takePhoto => localized('Take Photo');

  static String get recordVideo => localized('Record video');

  static String get uploadFromGallery => localized('Upload from gallery');

  static String get complaintRegisteredSuccessfully =>
      localized('Your complaint has been registered successfully!');

  static String get complaintAssignedToNodalOfficer => localized(
        'Your complaint will be assigned to a nodal officer after it has been reviewed.',
      );

  static String get shareYourAppExperience =>
      localized('Share your app experience with us');

  static String get addMore => localized('Add more');

  static String get mediaAddedFour => localized('/4 media added');

  static String get chooseLocation => localized('Choose location');

  static String get confirm => localized('Confirm');

  static String get commentRatingText =>
      localized('Write something (optional)');

  // 4 sep
  static String get pleaseSelectRequiredData =>
      localized('Please select the Required Data');

  static String get pleaseSelectComplaintType =>
      localized('Please select a Complaint Type');

  static String get pleaseEnterDescription =>
      localized('Please enter description');

  static String get pleaseSelectMedia =>
      localized('Please select at least one picture or video');

  static String get characters => localized('characters');

  static String get ok => localized('Okay');

  static String get searchHere => localized('Search here');
  static String get searchMemberHere => localized('Search Member here');

  static String get somethingWentWrong =>
      localized('Something went wrong, please try it again');

  static String get videoConstraint =>
      localized('You cannot add more than one video');

  // 5 sep
  static String get confirmLogout =>
      localized('Are you sure you want to logout your account? ');

  static String get cancel => localized('Cancel');

  static String get photoValidation =>
      localized('You can add upto total 3 photos & video or 1 PDF');

  // 6 sep
  static String get writeDescription => localized('Write description');

  static String get chooseLocationOnMap => localized('Choose location on map');

  // 7 sep
  static String get all => localized('All');

  static String get total => localized('Total');

  static String get pending => localized('Pending');

  static String get resolved => localized('Resolved');

  static String get rejected => localized('Rejected');

  static String get raiseComplaint => localized('Raise Complaint');

  static String get hi => localized('Hi');

  static String get pleaseEnterLocation =>
      localized('Please Select Your Current Location');

  static String get serDetailUpdated =>
      localized('User Details Updated Successfully');

  static String get userDetailUpdated =>
      localized('User Details Updated Successfully');

  static String get userDetailNotUpdated =>
      localized('User Details Not Updated Please Try Again');

  static String get fromGallery => localized('From gallery');

  static String get resolvedTill => localized('Resolve till');
  static String get escalatedOn => localized('Escalated on');
  static String get escalated => localized('Escalated');
  static String get downloadReport => localized('Download Report');
  static String get reviewResolution => localized('Review the resolution');
  static String get mediaAdded => localized('media added');
  static String get addDescription => localized('Add description');
  static String get writeHere => localized('Write here');
  static String get submittedSuccessfully =>
      localized('Submitted successfully');
  static String get resolvedSuccessfully => localized(
        'Good job on resolving the complaint in the allocated time. The admin will cross check the resolution and the complaint will be notified.',
      );

  static String get accept => localized('Accept');
  static String get reject => localized('Reject');
  static String get reasonOfRejection => localized('Reason of rejection');
  static String get reasonOfRejectionInfo => localized(
        'Please choose the reason why you are rejecting this complaint',
      );
  static String get other => localized('Other');
  static String get notifications => localized('Notifications');
  static String get noRecordFound => localized('No Record Found');

  // 22 jan
  static String get addPhotoVideosOrPdf =>
      localized('Add photos, video or PDF');
  // new

  static String get logoutConfirm => localized(
        'Are you sure you want to log out of your account? You can login anytime by entering your mobile number',
      );
  static String get enableLocation => localized("Enable Location Services");

  static String get photoValidationNoPdf =>
      localized('You can add upto total 3 photos or videos');
  static String get markAllAsRead => localized('Mark all as read');
  static String get send => localized('Send');
  static String get citizenReview => localized('Citizen’s review');
  static String get resolvedOn => localized('Resolved on');
  static String get reAssign => localized('Reassign');

  //30 jan
  static String get message => localized('Message');
  static String get date => localized('Date');
  static String get smallTo => localized('To');
  static String get oneImageRequired => localized('Image is required');
  static String get pleaseProvideImage =>
      localized('please provide atleast one media (image, video)');
  static String get resolutionAttachment => localized('Resolution Attachment');
  static String get largeFile => localized('Large file');
  static String get largeFileDescription =>
      localized('Please upload a small size file');
  static String get invalidImage => localized("Invalid Image Format");
  static String get invalidImageFormat =>
      "Please Select Valid Image Format (.jpg, .jpeg ,.png)";
  static String get update => localized('Update App');
  static String get hardUpdate =>
      localized('You need to update the app to continue');
  static String get softUpdate =>
      localized('New version available. Please update the app');
  static String get finish => localized('finish');
  static String get previous => localized('previous');
  static String get block => localized('Block');
  static String get clf => localized('CLF');
  static String get vo => localized('vo');
  static String get member => localized('member');
  static String get familyProfile => localized('family profile');
  static String get thereIsNoGroup => localized('there is no group');
  static String get thereIsNoMember => localized('there is no member');
  static String get chooseMember => localized('choose member');
  static String get addMember => localized('add Member');
  static String get save2 => localized('save2');
  static String get chooseGroup => localized('choose group');
  static String get badRequest => localized('bad_request');
  static String get forbidden => localized('forbidden');
  static String get pageNotFound => localized('page_not_found');
  static String get methodNotAllowed => localized('method_not_allowed');
  static String get requestTimeout => localized('request_timeout');
  static String get internalServerError => localized('internal_server_error');
  static String get badGateway => localized('bad_gateway');
  static String get serviceUnavailable => localized('service_unavailable');
  static String get gatewayTimeout => localized('gateway_timeout');
  static String get itsLonelyHere => localized('its_lonely_here');
  static String get dataNotFound => localized('data_not_found');
  static String get noInternet => localized('No Internet Found');
  static String get fillAllFields =>
      localized('Please fill all the fields correctly!');
  static String get enterUserName => localized('enter your username');
  static String get userName => localized('username');
  static String get enterPassword => localized('enter your password');
  static String get password => localized('password');
  static String get formSubmitted => localized('formSubmitted');
}
