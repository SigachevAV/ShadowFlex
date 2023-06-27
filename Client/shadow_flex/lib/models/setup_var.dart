class SetupVar {
  static final SetupVar _instanse = SetupVar._internal();
  bool rollMode = true;

  factory SetupVar() {
    return _instanse;
  }

  SetupVar._internal() {
    return;
  }
  void ChangeMode() {
    rollMode = !rollMode;
  }
}
