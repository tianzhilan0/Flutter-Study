
import 'package:blocstudy/blocs/bloc_provider.dart';
import 'package:blocstudy/data/protocol/LoginModel.dart';
import 'package:rxdart/rxdart.dart';

class MainBloc implements BlocBase {
  ///****** ****** ****** Home ****** ****** ****** /

  BehaviorSubject<List<BannerModel>> _banner =
      BehaviorSubject<List<BannerModel>>();

  Sink<List<BannerModel>> get _bannerSink => _banner.sink;

  Stream<List<BannerModel>> get bannerStream => _banner.stream;

  // BehaviorSubject<List<ReposModel>> _recRepos =
  //     BehaviorSubject<List<ReposModel>>();

  // Sink<List<ReposModel>> get _recReposSink => _recRepos.sink;

  // Stream<List<ReposModel>> get recReposStream => _recRepos.stream;

  // BehaviorSubject<List<ReposModel>> _recWxArticle =
  //     BehaviorSubject<List<ReposModel>>();

  // Sink<List<ReposModel>> get _recWxArticleSink => _recWxArticle.sink;

  // Stream<List<ReposModel>> get recWxArticleStream => _recWxArticle.stream;

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  Future getData({String labelId, int page}) {
    // TODO: implement getData
    return null;
  }

  @override
  Future onLoadMore({String labelId}) {
    // TODO: implement onLoadMore
    return null;
  }

  @override
  Future onRefresh({String labelId}) {
    // TODO: implement onRefresh
    return null;
  }

  ///****** ****** ****** Home ****** ****** ****** /
}