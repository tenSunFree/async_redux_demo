class HomeModel {
  ResultBean result;

  static HomeModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    HomeModel homeModel = HomeModel();
    homeModel.result = ResultBean.fromMap(map['result']);
    return homeModel;
  }

  Map toJson() => {
    "result": result,
  };
}

class ResultBean {
  int limit;
  int offset;
  int count;
  String sort;
  List<ResultsBean> results;

  static ResultBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    ResultBean resultBean = ResultBean();
    resultBean.limit = map['limit'];
    resultBean.offset = map['offset'];
    resultBean.count = map['count'];
    resultBean.sort = map['sort'];
    resultBean.results = List()..addAll(
      (map['results'] as List ?? []).map((o) => ResultsBean.fromMap(o))
    );
    return resultBean;
  }

  Map toJson() => {
    "limit": limit,
    "offset": offset,
    "count": count,
    "sort": sort,
    "results": results,
  };
}

class ResultsBean {
  String ABehavior;
  String ADistribution;
  String AVoice03URL;
  String APOIGroup;
  String ACode;
  String APic04ALT;
  String AVoice03ALT;
  String AThemeURL;
  String ASummary;
  String AUpdate;
  String APic02URL;
  String APdf01ALT;
  String ANameCh;
  String AThemeName;
  String APdf02ALT;
  String AFamily;
  String AAdopt;
  String AVoice01ALT;
  String APic02ALT;
  String AVedioURL;
  String APic04URL;
  String AOrder;
  String APdf01URL;
  String AVoice02ALT;
  String ADiet;
  String ANameLatin;
  String AFeature;
  String AHabitat;
  String APhylum;
  String AClass;
  String APic03ALT;
  String AAlsoKnown;
  String AVoice02URL;
  String ANameEn;
  String APic03URL;
  String AInterpretation;
  String ALocation;
  String AVoice01URL;
  String APdf02URL;
  String ACID;
  String AKeywords;
  String APic01URL;
  String AConservation;
  String APic01ALT;
  int Id;
  String AGeo;
  String ACrisis;

  static ResultsBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    ResultsBean resultsBean = ResultsBean();
    resultsBean.ABehavior = map['A_Behavior'];
    resultsBean.ADistribution = map['A_Distribution'];
    resultsBean.AVoice03URL = map['A_Voice03_URL'];
    resultsBean.APOIGroup = map['A_POIGroup'];
    resultsBean.ACode = map['A_Code'];
    resultsBean.APic04ALT = map['A_Pic04_ALT'];
    resultsBean.AVoice03ALT = map['A_Voice03_ALT'];
    resultsBean.AThemeURL = map['A_Theme_URL'];
    resultsBean.ASummary = map['A_Summary'];
    resultsBean.AUpdate = map['A_Update'];
    resultsBean.APic02URL = map['A_Pic02_URL'];
    resultsBean.APdf01ALT = map['A_pdf01_ALT'];
    resultsBean.ANameCh = map['?A_Name_Ch'];
    resultsBean.AThemeName = map['A_Theme_Name'];
    resultsBean.APdf02ALT = map['A_pdf02_ALT'];
    resultsBean.AFamily = map['A_Family'];
    resultsBean.AAdopt = map['A_Adopt'];
    resultsBean.AVoice01ALT = map['A_Voice01_ALT'];
    resultsBean.APic02ALT = map['A_Pic02_ALT'];
    resultsBean.AVedioURL = map['A_Vedio_URL'];
    resultsBean.APic04URL = map['A_Pic04_URL'];
    resultsBean.AOrder = map['A_Order'];
    resultsBean.APdf01URL = map['A_pdf01_URL'];
    resultsBean.AVoice02ALT = map['A_Voice02_ALT'];
    resultsBean.ADiet = map['A_Diet'];
    resultsBean.ANameLatin = map['A_Name_Latin'];
    resultsBean.AFeature = map['A_Feature'];
    resultsBean.AHabitat = map['A_Habitat'];
    resultsBean.APhylum = map['A_Phylum'];
    resultsBean.AClass = map['A_Class'];
    resultsBean.APic03ALT = map['A_Pic03_ALT'];
    resultsBean.AAlsoKnown = map['A_AlsoKnown'];
    resultsBean.AVoice02URL = map['A_Voice02_URL'];
    resultsBean.ANameEn = map['A_Name_En'];
    resultsBean.APic03URL = map['A_Pic03_URL'];
    resultsBean.AInterpretation = map['A_Interpretation'];
    resultsBean.ALocation = map['A_Location'];
    resultsBean.AVoice01URL = map['A_Voice01_URL'];
    resultsBean.APdf02URL = map['A_pdf02_URL'];
    resultsBean.ACID = map['A_CID'];
    resultsBean.AKeywords = map['A_Keywords'];
    resultsBean.APic01URL = map['A_Pic01_URL'];
    resultsBean.AConservation = map['A_Conservation'];
    resultsBean.APic01ALT = map['A_Pic01_ALT'];
    resultsBean.Id = map['_id'];
    resultsBean.AGeo = map['A_Geo'];
    resultsBean.ACrisis = map['A_Crisis'];
    return resultsBean;
  }

  Map toJson() => {
    "A_Behavior": ABehavior,
    "A_Distribution": ADistribution,
    "A_Voice03_URL": AVoice03URL,
    "A_POIGroup": APOIGroup,
    "A_Code": ACode,
    "A_Pic04_ALT": APic04ALT,
    "A_Voice03_ALT": AVoice03ALT,
    "A_Theme_URL": AThemeURL,
    "A_Summary": ASummary,
    "A_Update": AUpdate,
    "A_Pic02_URL": APic02URL,
    "A_pdf01_ALT": APdf01ALT,
    "?A_Name_Ch": ANameCh,
    "A_Theme_Name": AThemeName,
    "A_pdf02_ALT": APdf02ALT,
    "A_Family": AFamily,
    "A_Adopt": AAdopt,
    "A_Voice01_ALT": AVoice01ALT,
    "A_Pic02_ALT": APic02ALT,
    "A_Vedio_URL": AVedioURL,
    "A_Pic04_URL": APic04URL,
    "A_Order": AOrder,
    "A_pdf01_URL": APdf01URL,
    "A_Voice02_ALT": AVoice02ALT,
    "A_Diet": ADiet,
    "A_Name_Latin": ANameLatin,
    "A_Feature": AFeature,
    "A_Habitat": AHabitat,
    "A_Phylum": APhylum,
    "A_Class": AClass,
    "A_Pic03_ALT": APic03ALT,
    "A_AlsoKnown": AAlsoKnown,
    "A_Voice02_URL": AVoice02URL,
    "A_Name_En": ANameEn,
    "A_Pic03_URL": APic03URL,
    "A_Interpretation": AInterpretation,
    "A_Location": ALocation,
    "A_Voice01_URL": AVoice01URL,
    "A_pdf02_URL": APdf02URL,
    "A_CID": ACID,
    "A_Keywords": AKeywords,
    "A_Pic01_URL": APic01URL,
    "A_Conservation": AConservation,
    "A_Pic01_ALT": APic01ALT,
    "_id": Id,
    "A_Geo": AGeo,
    "A_Crisis": ACrisis,
  };
}