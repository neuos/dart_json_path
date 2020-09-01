import 'package:flutter_test/flutter_test.dart';

import 'package:dart_json_path/dart_json_path.dart';

void main() {
  group('examples', (){
    test('writeJsonInArray',() {
      var jsonPath = JsonPath.getInstance();
      var myJSON = '{ "name" : "vinay", "age":31, "city":"New York"}';
      var path = "\$.address[0].city";
      var nodeValue = "Agra";
      var outPut = jsonPath.write(myJSON, path, nodeValue);

      expect(outPut,'{"name":"vinay","age":31,"city":"New York","address":[{"city":"Agra"}]}');
    });

    test('writeInJson',() {
      var jsonPath = JsonPath.getInstance();
      var myJSON = '{ "age":31, "city":"New York"}';
      var path = "\$.name.firstName";
      var nodeValue = "Vinay";

      var outPut = jsonPath.write(myJSON, path, nodeValue);

      expect(outPut, '{"age":31,"city":"New York","name":{"firstName":"Vinay"}}');
    });

    test('readJson',() {
      var jsonPath = JsonPath.getInstance();
      var myJSON =
          '{"name":"vinay","age":31,"city":"New York","address":[{"city":"Agra"}]}';
      var path = "\$.address[0].city";

      var outPut = jsonPath.read(myJSON, path);

      expect(outPut, 'Agra');
    });

  });
}
