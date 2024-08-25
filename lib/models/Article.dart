class Article {
  final String title ;
  final String content ;
  final String urlImage ;

  Article({required this.title, required this.content, required this.urlImage});


  factory Article.fromjson(json){
    return Article(
        title: json["title"]?? "no title aquired", content:json["content"]?? "no content aquired" ,
        urlImage: json["urlToImage"]??"https://demofree.sirv.com/nope-not-here.jpg?w=150",
    );
  }



}