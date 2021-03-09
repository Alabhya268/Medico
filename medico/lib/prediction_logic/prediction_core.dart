import 'package:pytorch_mobile/enums/dtype.dart';
import 'package:pytorch_mobile/model.dart';
import 'package:pytorch_mobile/pytorch_mobile.dart';
import 'constants.dart';

class PredictionCore {
  int max(List a) {
    dynamic max = a[0];
    int pos = 0;

    for (int i = 1; i < a.length; i++) {
      if (a[i] > max) {
        max = a[i];
        pos = i;
      }
    }
    // print('The maximum probability with the label $pos is $max');
    return pos;
  }

  String decodeLabelDisease(int label) {
    return labelToDisease[label];
  }

  List<double> encodeLabelSymptom(List symptomList) {
    List<double> labelList = [];
    for (String x in symptomList) {
      labelList.add(symptomsToLabel[x].toDouble());
    }
    while (labelList.length < 17) {
      labelList.add(0.0);
    }
    return labelList;
  }

  Future<List> computeDisease(List sample) async {
    Model diseaseClassifier =
        await PyTorchMobile.loadModel('assets/models/model.pt');

    List prediction =
        await diseaseClassifier.getPrediction(sample, [17], DType.float32);
    return prediction;
  }

  Future<String> computeDiseaseName(List symptomList) async {
    List _symptoms = this.encodeLabelSymptom(symptomList);
    List diseaseCodes = await this.computeDisease(_symptoms);
    String disease = this.decodeLabelDisease(this.max(diseaseCodes));
    return disease;
  }

  Future<void> testFunc() async {
    String disease = await this.computeDiseaseName(['Acidity']);
    print('The disease with the maximum probability is $disease');
  }
}
