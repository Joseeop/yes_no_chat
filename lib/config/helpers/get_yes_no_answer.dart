import 'package:dio/dio.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer {
  final _dio = Dio();

  Future<Message> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');

    Map<String,dynamic> data={
      'answer' : 'yes',
      'forced' : 'true',
      'image' : 'http://asd/asdasdas'
    };

    final yesNoModel = YesNoModel.fromJsonMap(response.data);

    return yesNoModel.toMessageEntity();

  
}
}