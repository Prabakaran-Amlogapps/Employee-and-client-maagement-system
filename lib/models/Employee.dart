/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, override_on_non_overriding_member, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart' as amplify_core;


/** This is an auto generated class representing the Employee type in your schema. */
class Employee extends amplify_core.Model {
  static const classType = const _EmployeeModelType();
  final String id;
  final String? _name;
  final String? _image;
  final amplify_core.TemporalDateTime? _dateOfJoining;
  final String? _gender;
  final String? _position;
  final double? _salary;
  final String? _currentAddress;
  final String? _permanentAddress;
  final bool? _sameAsAbove;
  final String? _mobileNumber;
  final String? _proofDocument;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  EmployeeModelIdentifier get modelIdentifier {
      return EmployeeModelIdentifier(
        id: id
      );
  }
  
  String get name {
    try {
      return _name!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get image {
    return _image;
  }
  
  amplify_core.TemporalDateTime get dateOfJoining {
    try {
      return _dateOfJoining!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get gender {
    try {
      return _gender!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get position {
    try {
      return _position!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  double get salary {
    try {
      return _salary!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get currentAddress {
    try {
      return _currentAddress!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get permanentAddress {
    try {
      return _permanentAddress!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  bool get sameAsAbove {
    try {
      return _sameAsAbove!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get mobileNumber {
    try {
      return _mobileNumber!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get proofDocument {
    return _proofDocument;
  }
  
  amplify_core.TemporalDateTime get createdAt {
    try {
      return _createdAt!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  amplify_core.TemporalDateTime get updatedAt {
    try {
      return _updatedAt!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  const Employee._internal({required this.id, required name, image, required dateOfJoining, required gender, required position, required salary, required currentAddress, required permanentAddress, required sameAsAbove, required mobileNumber, proofDocument, required createdAt, required updatedAt}): _name = name, _image = image, _dateOfJoining = dateOfJoining, _gender = gender, _position = position, _salary = salary, _currentAddress = currentAddress, _permanentAddress = permanentAddress, _sameAsAbove = sameAsAbove, _mobileNumber = mobileNumber, _proofDocument = proofDocument, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Employee({String? id, required String name, String? image, required amplify_core.TemporalDateTime dateOfJoining, required String gender, required String position, required double salary, required String currentAddress, required String permanentAddress, required bool sameAsAbove, required String mobileNumber, String? proofDocument, required amplify_core.TemporalDateTime createdAt, required amplify_core.TemporalDateTime updatedAt}) {
    return Employee._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      name: name,
      image: image,
      dateOfJoining: dateOfJoining,
      gender: gender,
      position: position,
      salary: salary,
      currentAddress: currentAddress,
      permanentAddress: permanentAddress,
      sameAsAbove: sameAsAbove,
      mobileNumber: mobileNumber,
      proofDocument: proofDocument,
      createdAt: createdAt,
      updatedAt: updatedAt);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Employee &&
      id == other.id &&
      _name == other._name &&
      _image == other._image &&
      _dateOfJoining == other._dateOfJoining &&
      _gender == other._gender &&
      _position == other._position &&
      _salary == other._salary &&
      _currentAddress == other._currentAddress &&
      _permanentAddress == other._permanentAddress &&
      _sameAsAbove == other._sameAsAbove &&
      _mobileNumber == other._mobileNumber &&
      _proofDocument == other._proofDocument &&
      _createdAt == other._createdAt &&
      _updatedAt == other._updatedAt;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Employee {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("image=" + "$_image" + ", ");
    buffer.write("dateOfJoining=" + (_dateOfJoining != null ? _dateOfJoining!.format() : "null") + ", ");
    buffer.write("gender=" + "$_gender" + ", ");
    buffer.write("position=" + "$_position" + ", ");
    buffer.write("salary=" + (_salary != null ? _salary!.toString() : "null") + ", ");
    buffer.write("currentAddress=" + "$_currentAddress" + ", ");
    buffer.write("permanentAddress=" + "$_permanentAddress" + ", ");
    buffer.write("sameAsAbove=" + (_sameAsAbove != null ? _sameAsAbove!.toString() : "null") + ", ");
    buffer.write("mobileNumber=" + "$_mobileNumber" + ", ");
    buffer.write("proofDocument=" + "$_proofDocument" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Employee copyWith({String? name, String? image, amplify_core.TemporalDateTime? dateOfJoining, String? gender, String? position, double? salary, String? currentAddress, String? permanentAddress, bool? sameAsAbove, String? mobileNumber, String? proofDocument, amplify_core.TemporalDateTime? createdAt, amplify_core.TemporalDateTime? updatedAt}) {
    return Employee._internal(
      id: id,
      name: name ?? this.name,
      image: image ?? this.image,
      dateOfJoining: dateOfJoining ?? this.dateOfJoining,
      gender: gender ?? this.gender,
      position: position ?? this.position,
      salary: salary ?? this.salary,
      currentAddress: currentAddress ?? this.currentAddress,
      permanentAddress: permanentAddress ?? this.permanentAddress,
      sameAsAbove: sameAsAbove ?? this.sameAsAbove,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      proofDocument: proofDocument ?? this.proofDocument,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt);
  }
  
  Employee copyWithModelFieldValues({
    ModelFieldValue<String>? name,
    ModelFieldValue<String?>? image,
    ModelFieldValue<amplify_core.TemporalDateTime>? dateOfJoining,
    ModelFieldValue<String>? gender,
    ModelFieldValue<String>? position,
    ModelFieldValue<double>? salary,
    ModelFieldValue<String>? currentAddress,
    ModelFieldValue<String>? permanentAddress,
    ModelFieldValue<bool>? sameAsAbove,
    ModelFieldValue<String>? mobileNumber,
    ModelFieldValue<String?>? proofDocument,
    ModelFieldValue<amplify_core.TemporalDateTime>? createdAt,
    ModelFieldValue<amplify_core.TemporalDateTime>? updatedAt
  }) {
    return Employee._internal(
      id: id,
      name: name == null ? this.name : name.value,
      image: image == null ? this.image : image.value,
      dateOfJoining: dateOfJoining == null ? this.dateOfJoining : dateOfJoining.value,
      gender: gender == null ? this.gender : gender.value,
      position: position == null ? this.position : position.value,
      salary: salary == null ? this.salary : salary.value,
      currentAddress: currentAddress == null ? this.currentAddress : currentAddress.value,
      permanentAddress: permanentAddress == null ? this.permanentAddress : permanentAddress.value,
      sameAsAbove: sameAsAbove == null ? this.sameAsAbove : sameAsAbove.value,
      mobileNumber: mobileNumber == null ? this.mobileNumber : mobileNumber.value,
      proofDocument: proofDocument == null ? this.proofDocument : proofDocument.value,
      createdAt: createdAt == null ? this.createdAt : createdAt.value,
      updatedAt: updatedAt == null ? this.updatedAt : updatedAt.value
    );
  }
  
  Employee.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _name = json['name'],
      _image = json['image'],
      _dateOfJoining = json['dateOfJoining'] != null ? amplify_core.TemporalDateTime.fromString(json['dateOfJoining']) : null,
      _gender = json['gender'],
      _position = json['position'],
      _salary = (json['salary'] as num?)?.toDouble(),
      _currentAddress = json['currentAddress'],
      _permanentAddress = json['permanentAddress'],
      _sameAsAbove = json['sameAsAbove'],
      _mobileNumber = json['mobileNumber'],
      _proofDocument = json['proofDocument'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'name': _name, 'image': _image, 'dateOfJoining': _dateOfJoining?.format(), 'gender': _gender, 'position': _position, 'salary': _salary, 'currentAddress': _currentAddress, 'permanentAddress': _permanentAddress, 'sameAsAbove': _sameAsAbove, 'mobileNumber': _mobileNumber, 'proofDocument': _proofDocument, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'name': _name,
    'image': _image,
    'dateOfJoining': _dateOfJoining,
    'gender': _gender,
    'position': _position,
    'salary': _salary,
    'currentAddress': _currentAddress,
    'permanentAddress': _permanentAddress,
    'sameAsAbove': _sameAsAbove,
    'mobileNumber': _mobileNumber,
    'proofDocument': _proofDocument,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<EmployeeModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<EmployeeModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final NAME = amplify_core.QueryField(fieldName: "name");
  static final IMAGE = amplify_core.QueryField(fieldName: "image");
  static final DATEOFJOINING = amplify_core.QueryField(fieldName: "dateOfJoining");
  static final GENDER = amplify_core.QueryField(fieldName: "gender");
  static final POSITION = amplify_core.QueryField(fieldName: "position");
  static final SALARY = amplify_core.QueryField(fieldName: "salary");
  static final CURRENTADDRESS = amplify_core.QueryField(fieldName: "currentAddress");
  static final PERMANENTADDRESS = amplify_core.QueryField(fieldName: "permanentAddress");
  static final SAMEASABOVE = amplify_core.QueryField(fieldName: "sameAsAbove");
  static final MOBILENUMBER = amplify_core.QueryField(fieldName: "mobileNumber");
  static final PROOFDOCUMENT = amplify_core.QueryField(fieldName: "proofDocument");
  static final CREATEDAT = amplify_core.QueryField(fieldName: "createdAt");
  static final UPDATEDAT = amplify_core.QueryField(fieldName: "updatedAt");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Employee";
    modelSchemaDefinition.pluralName = "Employees";
    
    modelSchemaDefinition.authRules = [
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.PUBLIC,
        operations: const [
          amplify_core.ModelOperation.CREATE,
          amplify_core.ModelOperation.UPDATE,
          amplify_core.ModelOperation.DELETE,
          amplify_core.ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Employee.NAME,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Employee.IMAGE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Employee.DATEOFJOINING,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Employee.GENDER,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Employee.POSITION,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Employee.SALARY,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Employee.CURRENTADDRESS,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Employee.PERMANENTADDRESS,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Employee.SAMEASABOVE,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Employee.MOBILENUMBER,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Employee.PROOFDOCUMENT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Employee.CREATEDAT,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Employee.UPDATEDAT,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _EmployeeModelType extends amplify_core.ModelType<Employee> {
  const _EmployeeModelType();
  
  @override
  Employee fromJson(Map<String, dynamic> jsonData) {
    return Employee.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Employee';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Employee] in your schema.
 */
class EmployeeModelIdentifier implements amplify_core.ModelIdentifier<Employee> {
  final String id;

  /** Create an instance of EmployeeModelIdentifier using [id] the primary key. */
  const EmployeeModelIdentifier({
    required this.id});
  
  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{
    'id': id
  });
  
  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
    .entries
    .map((entry) => (<String, dynamic>{ entry.key: entry.value }))
    .toList();
  
  @override
  String serializeAsString() => serializeAsMap().values.join('#');
  
  @override
  String toString() => 'EmployeeModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is EmployeeModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}