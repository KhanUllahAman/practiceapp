class TestingModel {
  final bool success;
  final String message;
  final TestingData? data;

  TestingModel({required this.success, required this.message, this.data});

  factory TestingModel.fromJson(Map<String, dynamic> json) {
    return TestingModel(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data: TestingData.fromJson(json['data'] ?? {}),
    );
  }
}

class TestingData {
  final Customer? customer;
  final PaginationData? pagination;
  final List<Order> orders;
  TestingData({this.customer, this.pagination, required this.orders});

  factory TestingData.fromJson(Map<String, dynamic> json) {
    return TestingData(
      customer: Customer.fromJson(json['customer'] ?? {}),
      pagination: PaginationData.fromJson(json['pagination'] ?? {}),
      orders:
          (json['orders'] as List<dynamic>?)
              ?.map((e) => Order.fromJson(e))
              .toList() ??
          [],
    );
  }
}

class Customer {
  final int id;
  final String name;
  final String email;
  final String phone;
  final Address? address;

  Customer({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    this.address,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      address: Address.fromJson(json['address'] ?? {}),
    );
  }
}

class PaginationData {
  final int currentPage;
  final int totalPages;
  final int totalRecords;

  PaginationData({
    required this.currentPage,
    required this.totalPages,
    required this.totalRecords,
  });

  factory PaginationData.fromJson(Map<String, dynamic> json) {
    return PaginationData(
      currentPage: json['currentPage'] ?? 0,
      totalPages: json['totalPages'] ?? 0,
      totalRecords: json['totalRecords'] ?? 0,
    );
  }
}

class Address {
  final String city;
  final String area;
  final String postalCode;

  Address({required this.city, required this.area, required this.postalCode});

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      city: json['city'] ?? '',
      area: json['area'] ?? '',
      postalCode: json['postalCode'] ?? '',
    );
  }
}

class Order {
  final int orderId;
  final String status;
  final double totalAmount;
  final String createdAt;
  final List<OrderItem> items;

  Order({
    required this.orderId,
    required this.status,
    required this.totalAmount,
    required this.createdAt,
    required this.items,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      orderId: json['orderId'] ?? 0,
      status: json['status'] ?? '',
      totalAmount: (json['totalAmount'] ?? 0).toDouble(),
      createdAt: json['createdAt'] ?? '',

      items:
          (json['items'] as List<dynamic>?)
              ?.map((e) => OrderItem.fromJson(e))
              .toList() ??
          [],
    );
  }
}

class OrderItem {
  final int productId;
  final String name;
  final int quantity;
  final double price;

  OrderItem({
    required this.productId,
    required this.name,
    required this.quantity,
    required this.price,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      productId: json['productId'] ?? 0,
      name: json['name'] ?? '',
      quantity: json['quantity'] ?? 0,
      price: (json['price'] ?? 0).toDouble(),
    );
  }
}
