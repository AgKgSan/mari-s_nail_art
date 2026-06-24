// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class BookingModel {
  final int serviceId;
  final String bookingDate;
  final double amount;
  final double? extraAmount;
  final String paymentType;
  final String? notes;
  final int id;
  final int customeId;
  final String customerName;
  final String customerPhone;
  final String serviceName;
  final String status;
  final String createdByCustomerOrStaffName;
  final String createdAt;
  final String? cancelledBy;

  BookingModel({
    required this.serviceId,
    required this.bookingDate,
    required this.amount,
    this.extraAmount,
    required this.paymentType,
    this.notes,
    required this.id,
    required this.customeId,
    required this.customerName,
    required this.customerPhone,
    required this.serviceName,
    required this.status,
    required this.createdByCustomerOrStaffName,
    required this.createdAt,
    required this.cancelledBy,
  });

  BookingModel copyWith({
    int? serviceId,
    String? bookingDate,
    double? amount,
    double? extraAmount,
    String? paymentType,
    String? notes,
    int? id,
    int? customeId,
    String? customerName,
    String? customerPhone,
    String? serviceName,
    String? status,
    String? createdByCustomerOrStaffName,
    String? createdAt,
    String? cancelledBy,
  }) {
    return BookingModel(
      serviceId: serviceId ?? this.serviceId,
      bookingDate: bookingDate ?? this.bookingDate,
      amount: amount ?? this.amount,
      extraAmount: extraAmount ?? this.extraAmount,
      paymentType: paymentType ?? this.paymentType,
      notes: notes ?? this.notes,
      id: id ?? this.id,
      customeId: customeId ?? this.customeId,
      customerName: customerName ?? this.customerName,
      customerPhone: customerPhone ?? this.customerPhone,
      serviceName: serviceName ?? this.serviceName,
      status: status ?? this.status,
      createdByCustomerOrStaffName:
          createdByCustomerOrStaffName ?? this.createdByCustomerOrStaffName,
      createdAt: createdAt ?? this.createdAt,
      cancelledBy: cancelledBy ?? this.cancelledBy,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'serviceId': serviceId,
      'bookingDate': bookingDate,
      'amount': amount,
      'extraAmount': extraAmount,
      'paymentType': paymentType,
      'notes': notes,
      'id': id,
      'customeId': customeId,
      'customerName': customerName,
      'customerPhone': customerPhone,
      'serviceName': serviceName,
      'status': status,
      'createdByCustomerOrStaffName': createdByCustomerOrStaffName,
      'createdAt': createdAt,
      'cancelledBy': cancelledBy,
    };
  }

  factory BookingModel.fromMap(Map<String, dynamic> map) {
    return BookingModel(
      serviceId: map['serviceId'] as int? ?? 0,
      bookingDate: map['bookingDate'] as String? ?? '',
      amount: map['amount'] != null ? (map['amount'] as num).toDouble() : 0.0,
      extraAmount: map['extraAmount'] != null
          ? (map['extraAmount'] as num).toDouble()
          : null,
      paymentType: map['paymentType'] as String? ?? '',
      notes: map['notes'] as String?,
      id: map['id'] as int? ?? 0,
      customeId: map['customeId'] as int? ?? 0,

      customerName: map['customerName'] as String? ?? '',
      customerPhone: map['customerPhone'] as String? ?? '',
      serviceName: map['serviceName'] as String? ?? '',
      status: map['status'] as String? ?? '',
      createdByCustomerOrStaffName:
          map['createdByCustomerOrStaffName'] as String? ?? '',
      createdAt: map['createdAt'] as String? ?? '',

      cancelledBy: map['cancelledBy'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory BookingModel.fromJson(String source) =>
      BookingModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BookingModel(serviceId: $serviceId, bookingDate: $bookingDate, amount: $amount, extraAmount: $extraAmount, paymentType: $paymentType, notes: $notes, id: $id, customeId: $customeId, customerName: $customerName, customerPhone: $customerPhone, serviceName: $serviceName, status: $status, createdByCustomerOrStaffName: $createdByCustomerOrStaffName, createdAt: $createdAt, cancelledBy: $cancelledBy)';
  }

  @override
  bool operator ==(covariant BookingModel other) {
    if (identical(this, other)) return true;

    return other.serviceId == serviceId &&
        other.bookingDate == bookingDate &&
        other.amount == amount &&
        other.extraAmount == extraAmount &&
        other.paymentType == paymentType &&
        other.notes == notes &&
        other.id == id &&
        other.customeId == customeId &&
        other.customerName == customerName &&
        other.customerPhone == customerPhone &&
        other.serviceName == serviceName &&
        other.status == status &&
        other.createdByCustomerOrStaffName == createdByCustomerOrStaffName &&
        other.createdAt == createdAt &&
        other.cancelledBy == cancelledBy;
  }

  @override
  int get hashCode {
    return serviceId.hashCode ^
        bookingDate.hashCode ^
        amount.hashCode ^
        extraAmount.hashCode ^
        paymentType.hashCode ^
        notes.hashCode ^
        id.hashCode ^
        customeId.hashCode ^
        customerName.hashCode ^
        customerPhone.hashCode ^
        serviceName.hashCode ^
        status.hashCode ^
        createdByCustomerOrStaffName.hashCode ^
        createdAt.hashCode ^
        cancelledBy.hashCode;
  }
}
