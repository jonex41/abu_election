import 'dart:convert';

import 'package:flutter/foundation.dart';

class Model {
  String id;
  bool isVote;
  Map<String, dynamic> list;

  Model({
    required this.id,
    this.isVote = false,
    required this.list,
  });

  Model copyWith({
    String? id,
    bool? isVote,
    Map<String, dynamic>? list,
  }) {
    return Model(
      id: id ?? this.id,
      isVote: isVote ?? this.isVote,
      list: list ?? this.list,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'isVote': isVote});
    result.addAll({'list': list});

    return result;
  }

  factory Model.fromMap(Map<String, dynamic> map) {
    return Model(
      id: map['id'] ?? '',
      isVote: map['isVote'],
      list: Map<String, dynamic>.from(map['list']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Model.fromJson(String source) => Model.fromMap(json.decode(source));

  @override
  String toString() => 'Model(id: $id, isVote: $isVote, list: $list)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Model &&
        other.id == id &&
        other.isVote == isVote &&
        mapEquals(other.list, list);
  }

  @override
  int get hashCode => id.hashCode ^ isVote.hashCode ^ list.hashCode;
}
