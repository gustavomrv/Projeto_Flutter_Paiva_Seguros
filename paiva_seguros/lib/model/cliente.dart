// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Cliente {
  String? nome;
  String? cpf;
  String? email;
  String? telefone;
  String? senha;
  Cliente({
    this.nome,
    this.cpf,
    this.email,
    this.telefone,
    this.senha,
  });

  Cliente copyWith({
    String? nome,
    String? cpf,
    String? email,
    String? telefone,
    String? senha,
  }) {
    return Cliente(
      nome: nome ?? this.nome,
      cpf: cpf ?? this.cpf,
      email: email ?? this.email,
      telefone: telefone ?? this.telefone,
      senha: senha ?? this.senha,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nome': nome,
      'cpf': cpf,
      'email': email,
      'telefone': telefone,
      'senha': senha,
    };
  }

  factory Cliente.fromMap(Map<String, dynamic> map) {
    return Cliente(
      nome: map['nome'] != null ? map['nome'] as String : null,
      cpf: map['cpf'] != null ? map['cpf'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      telefone: map['telefone'] != null ? map['telefone'] as String : null,
      senha: map['senha'] != null ? map['senha'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Cliente.fromJson(String source) => Cliente.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Cliente(nome: $nome, cpf: $cpf, email: $email, telefone: $telefone, senha: $senha)';
  }

  @override
  bool operator ==(covariant Cliente other) {
    if (identical(this, other)) return true;
  
    return 
      other.nome == nome &&
      other.cpf == cpf &&
      other.email == email &&
      other.telefone == telefone &&
      other.senha == senha;
  }

  @override
  int get hashCode {
    return nome.hashCode ^
      cpf.hashCode ^
      email.hashCode ^
      telefone.hashCode ^
      senha.hashCode;
  }
}
