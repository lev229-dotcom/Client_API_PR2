class GetModel {
  String? option;
  String? type;
  bool status = true;
  int fetch = 0;
  int offset = 0;

  GetModel(this.fetch, this.offset, this.option, this.status, this.type);

  Map<String, dynamic>? asMap() {
    return {
      'option': option,
      'type': type,
      'status': status,
      'fetch': fetch,
      'offset': offset
    };
  }

  void readFromMap(Map<String, dynamic> object) {
    option = object["option"];
    type = object["type"];
    status = object["status"] ?? true;
    fetch = object["fetch"] ?? 0;
    offset = object["offset"] ?? 0;
  }
}
