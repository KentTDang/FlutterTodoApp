class ToDo {
  String task;
  bool isDone;

  ToDo({
    required this.task,
    required this.isDone,
  });

  ToDo.fromJson(Map<String, Object?> json) 
      : this(
        task: json['task']! as String, 
        isDone: json['isDone']! as bool
      );

  ToDo copyWith({
    String? id,
    String? task,
    bool? isDone,
  }) {
    return ToDo(
      task: task ?? this.task,
      isDone: isDone ?? this.isDone,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'task': task,
      'isDone': isDone
    };
  }
}