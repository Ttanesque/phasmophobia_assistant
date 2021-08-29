class Objective {
  String _name = "";

  String _description = "";

  String _details = "";

  List<String> _images = [];

  Objective(name, images) {
    if (name == null) name = "undefined";
    _name = name;
    _description = name + ".description";
    _details = name + ".details";
    _images = images;
  }

  String description() {
    return _description;
  }

  String details() {
    return _details;
  }

  String name() {
    return _name;
  }

  List<String> images() {
    return _images;
  }

  @override
  String toString() {
    var imagesS = "";
    for (var item in _images) {
      imagesS += item;
    }
    return "{name: " +
        _name +
        ",\ndescription: " +
        _description +
        ",\ndetails: " +
        _details +
        ",\nimages:" +
        imagesS +
        "}";
  }
}
