// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Mensagem {
  String? remetente;
  String? destinatario;
  String? texto;
  DateTime? tempo;
  Mensagem({
    this.remetente,
    this.destinatario,
    this.texto,
    this.tempo,
  });

  Mensagem copyWith({
    String? remetente,
    String? destinatario,
    String? texto,
    DateTime? tempo,
  }) {
    return Mensagem(
      remetente: remetente ?? this.remetente,
      destinatario: destinatario ?? this.destinatario,
      texto: texto ?? this.texto,
      tempo: tempo ?? this.tempo,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'remetente': remetente,
      'destinatario': destinatario,
      'texto': texto,
      'tempo': tempo?.millisecondsSinceEpoch,
    };
  }

  factory Mensagem.fromMap(Map<String, dynamic> map) {
    return Mensagem(
      remetente: map['remetente'] != null ? map['remetente'] as String : null,
      destinatario: map['destinatario'] != null ? map['destinatario'] as String : null,
      texto: map['texto'] != null ? map['texto'] as String : null,
      tempo: map['tempo'] != null ? DateTime.fromMillisecondsSinceEpoch(map['tempo'] as int) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Mensagem.fromJson(String source) => Mensagem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Mensagem(remetente: $remetente, destinatario: $destinatario, texto: $texto, tempo: $tempo)';
  }

  @override
  bool operator ==(covariant Mensagem other) {
    if (identical(this, other)) return true;
  
    return 
      other.remetente == remetente &&
      other.destinatario == destinatario &&
      other.texto == texto &&
      other.tempo == tempo;
  }

  @override
  int get hashCode {
    return remetente.hashCode ^
      destinatario.hashCode ^
      texto.hashCode ^
      tempo.hashCode;
  }
}
