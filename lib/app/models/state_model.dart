class StateModel {
  final String state;
  final int codeState;
  StateModel({this.state = "", this.codeState = 0});

  factory StateModel.fromMap(Map<String, dynamic> map) {
    return StateModel(
      state: map['State'] ?? '',
      codeState: map['CodState'] ?? '',
    );
  }
}
