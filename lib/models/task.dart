
class Task{

  String description;
  DateTime creationDateTime;

  Task(this.description): creationDateTime = DateTime.now();
  
  Task.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    creationDateTime = json['creationDateTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['creationDateTime'] = this.creationDateTime;
    return data;
  }
}
