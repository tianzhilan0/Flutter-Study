class SelectDetailModel {
  int id;
  String title;
  String slug;
  int newlyaddedat;
  String image;
  String contentwithouthtml;
  String contentinfull;
  int subscriberscount;
  int notescount;


  SelectDetailModel({
    this.id,
    this.title,
    this.slug,
    this.newlyaddedat,
    this.image,
    this.contentwithouthtml,
    this.contentinfull,
    this.subscriberscount,
    this.notescount,
  });

  factory SelectDetailModel.fromJson(Map<String, dynamic> json) {
    return SelectDetailModel(
      id: json['id'],
      title: json['title'],
      slug: json['slug'],
      newlyaddedat: json['newly_added_at'],
      image: json['image'],
      contentwithouthtml: json['content_without_html'],
      contentinfull: json['content_in_full'],
      subscriberscount: json['subscribers_count'],
      notescount: json['notes_count'],
    );
  }
}