import 'apicall.dart';
import 'dart:convert';
class Datalogin{
  Future<dynamic> stuff(value1,value2) async {
    var url = Uri.parse('http://127.0.0.1:5000/login?Username=$value1&Password=$value2');
    var datalol = await getdata(url);
    return datalol;
  }
}
int pageNo = 1;
String sign = 'false';
class integer {
  conv(val0) {
    if (val0 == 'true') {
      pageNo = 10;
    }
    return pageNo;
  }
}
Future<dynamic> decodelogin(value1,value2) async {
  if (value1 != 0 && value2 != 0) {
    return Datalogin().stuff(value1, value2);
  }
}
