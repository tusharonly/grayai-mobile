// ignore_for_file: public_member_api_docs, sort_constructors_first
class ChatModel {
  final String id;
  final String name;
  final String description;
  final bool isPro;
  final bool isMax;
  final bool isNew;
  final bool isDefault;

  ChatModel({
    required this.id,
    required this.name,
    required this.description,
    required this.isPro,
    required this.isMax,
    required this.isNew,
    required this.isDefault,
  });

  factory ChatModel.fromMap(Map<String, dynamic> json) {
    return ChatModel(
      id: json['id'],
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      isPro: json['pro'] ?? false,
      isMax: json['max'] ?? false,
      isNew: json['new'] ?? false,
      isDefault: json['default'] ?? false,
    );
  }

  @override
  String toString() {
    return 'ChatModel(id: $id, name: $name, description: $description, isPro: $isPro, isMax: $isMax, isNew: $isNew, isDefault: $isDefault)';
  }
}
