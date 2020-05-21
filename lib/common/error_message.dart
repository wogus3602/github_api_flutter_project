class ErrorMessage {
  static String getValue(int errorCode) {
    switch (errorCode) {
      case 500100:
        return "아이디 또는 비밀번호가 일치하지 않습니다.";
      case 500705:
        return "인증번호가 일치하지 않습니다";
      default:
        return "";
    }
  }
}
