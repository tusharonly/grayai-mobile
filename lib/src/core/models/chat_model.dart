// ignore_for_file: public_member_api_docs, sort_constructors_first
class ChatModel {
  final String id;
  final String name;
  final String description;
  final bool isPro;
  final bool isMax;
  final bool isNew;

  ChatModel({
    required this.id,
    required this.name,
    required this.description,
    required this.isPro,
    required this.isMax,
    required this.isNew,
  });

  factory ChatModel.fromMap(Map<String, dynamic> json) {
    return ChatModel(
      id: json['id'],
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      isPro: json['pro'] ?? false,
      isMax: json['max'] ?? false,
      isNew: json['new'] ?? false,
    );
  }

  ChatModel copyWith({
    String? id,
    String? provider,
    String? name,
    String? description,
    bool? isPro,
    bool? isMax,
    bool? isNew,
  }) {
    return ChatModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      isPro: isPro ?? this.isPro,
      isMax: isMax ?? this.isMax,
      isNew: isNew ?? this.isNew,
    );
  }

  @override
  String toString() {
    return 'ChatModel(id: $id, name: $name, description: $description, isPro: $isPro, isMax: $isMax, isNew: $isNew)';
  }
}
