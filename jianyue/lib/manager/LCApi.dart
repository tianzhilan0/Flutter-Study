class LCApi {

  //推荐文章
  static const articlelist =  '/asimov/trending/now?count=15&note_ids=';
  
  //推荐作者
  static const authorlist = '/users/recommended?seen_ids=&count=100&only_unfollowed=true';

  //文章详情
  static const articleDetail = '/asimov/p/';
  //文章详情-评论
  static const articleDetailComment = '/shakespeare/notes/';

  //精选
  static const selectDetail = '/asimov/collections/slug/';
  //精选-最新评论
  static const selectDetailCommentList = '/asimov/collections/slug/';


  //个人详情
  static const userDetail = '/asimov/users/slug/';
// https://www.jianshu.com/asimov/users/slug/3f2268ad1f94/public_notes?page=1&count=10&order_by=shared_at
  // 投资数据
  static const investlist = 'api/jianyueinvest/data';

}
