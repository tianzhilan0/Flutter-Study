
class InvestModel 
{
  List<dynamic> header;
  String firstMargin;
  String regularlyInvest;
  String secondMargin;
  List<dynamic> currentInvest;
  List<dynamic> youlike;
  List<dynamic> information;

  InvestModel({
    this.header,
    this.firstMargin,
    this.regularlyInvest,
    this.secondMargin,
    this.currentInvest,
    this.youlike,
    this.information,
    });

  factory InvestModel.fromJson(Map<String, dynamic> json){
    return InvestModel(
      header: json['header'],
      firstMargin: json['firstMargin'],
      regularlyInvest: json['regularlyInvest'],
      secondMargin: json['secondMargin'],
      currentInvest: json['currentInvest'],
      youlike: json['youlike'],
      information: json['information'],
    );
  }
}