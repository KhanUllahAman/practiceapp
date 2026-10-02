class PracticeModelPost {
  final int id;
  final String title;
  final String message;

  PracticeModelPost({
    required this.id,
    required this.title,
    required this.message,
  });

  factory PracticeModelPost.fromJson(Map<String, dynamic> json) {
    return PracticeModelPost(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      message: json['message'] ?? '',
    );
  }
}