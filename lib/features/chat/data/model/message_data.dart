
class MessageData {
  final String role;
  final String content;


  MessageData({
    required this.role,
    required this.content,
  });


  factory MessageData.fromJson(Map<String, dynamic> json) {
    return MessageData(
      role: json['role'],
      content: json['content'],
    );
  }


  Map<String,dynamic> toJson() =>{
    "role":role,
    "content":content,
  };

}
