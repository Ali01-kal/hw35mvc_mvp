class ErrorHandler {
  static String handle(Object error){
    return error.toString().replaceFirst('Exception: ','');
  }
}
