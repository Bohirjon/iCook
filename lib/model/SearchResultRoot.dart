import 'package:ICook/Model/SearchResult.dart';

class SearchResultRoot {
  List<SearchResult> results;
  int offset;
  int number;
  int totalResults;

  SearchResultRoot({this.results, this.offset, this.number, this.totalResults});

  SearchResultRoot.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = new List<SearchResult>();
      json['results'].forEach((v) {
        results.add(new SearchResult.fromJson(v));
      });
    }
    offset = json['offset'];
    number = json['number'];
    totalResults = json['totalResults'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    data['offset'] = this.offset;
    data['number'] = this.number;
    data['totalResults'] = this.totalResults;
    return data;
  }
}
