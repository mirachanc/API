import 'package:dogs/dog/repository/dog_repository.dart';

class DogController {

  final DogRepository _repository = DogRepository();
  late DogDelegate delegate;
  String image = "";

  Future<void> getDogImage() async {
    final result = await _repository.getDogImage();
    if(result != null){
      image = result.imageUrl;
      delegate.notify(DogResults.refresh);
    } else {
      delegate.notify(DogResults.error);
    }
  }

}

enum DogResults {
  refresh,
  error,
}

mixin DogDelegate {
  void notify(DogResults result);
}