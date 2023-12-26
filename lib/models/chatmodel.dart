class ChatModel {
  String? name;
  String? icon;
  bool? isGroup;
  String? time;
  String? CurrentMessage;
  String? status;
  bool select=false;
  int? id;

  ChatModel({
    this.name,
    this.icon,
    this.isGroup,
    this.time,
    this.CurrentMessage,
    this.status,
    this.select=false,
    this.id,
  });
}
