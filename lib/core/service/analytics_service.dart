import 'dart:convert';

import 'package:commerce_hub/constants.dart';
import 'package:commerce_hub/core/entity/product_input_entity.dart';
import 'package:commerce_hub/core/service/shared_preferences_singleton.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

/// Interaction types for analytics tracking
enum InteractionType {
  viewProduct,
  addToFavorites,
  removeFromFavorites,
  addToCart,
  removeFromCart,
  search,
  checkout,
}

/// Represents a single user interaction event
class InteractionEvent {
  final String userId;
  final DateTime timestamp;
  final InteractionType type;
  final String? productId;
  final Map<String, dynamic>? additionalData;

  InteractionEvent({
    required this.userId,
    required this.type,
    this.productId,
    this.additionalData,
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'timestamp': timestamp.toIso8601String(),
      'type': type.toString(),
      'productId': productId,
      'additionalData': additionalData,
    };
  }

  factory InteractionEvent.fromJson(Map<String, dynamic> json) {
    return InteractionEvent(
      userId: json['userId'],
      timestamp: DateTime.parse(json['timestamp']),
      type: InteractionType.values.firstWhere(
        (e) => e.toString() == json['type'],
        orElse: () => InteractionType.viewProduct,
      ),
      productId: json['productId'],
      additionalData: json['additionalData'],
    );
  }
}

/// Service for tracking user interactions within the app
class AnalyticsService {
  static const String _anonymousUserKey = 'anonymous_user_id';
  static const String _interactionsKey = 'user_interactions';
  final int _maxStoredInteractions =
      1000; // Limit to prevent excessive storage usage

  /// Gets the current user ID (authenticated or anonymous)
  String getUserId() {
    try {
      // Try to get authenticated user ID
      var jsonString = Prefs.getString(kUserData);
      if (jsonString.isNotEmpty) {
        Map<String, dynamic> userData = jsonDecode(jsonString);
        if (userData.containsKey('uid') && userData['uid'] != null) {
          return userData['uid'];
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error getting authenticated user: $e');
      }
    }

    // Fall back to anonymous ID
    return _getOrCreateAnonymousId();
  }

  /// Gets or creates an anonymous user ID
  String _getOrCreateAnonymousId() {
    String anonymousId = Prefs.getString(_anonymousUserKey);
    if (anonymousId.isEmpty) {
      anonymousId = const Uuid().v4();
      Prefs.setString(_anonymousUserKey, anonymousId);
    }
    return anonymousId;
  }

  /// Track a user viewing a product
  void trackProductView(ProductInputEntity product) {
    _trackInteraction(
      type: InteractionType.viewProduct,
      productId: product.code,
      additionalData: {
        'productName': product.name,
        'price': product.price,
      },
    );
  }

  /// Track adding a product to favorites
  void trackAddToFavorites(ProductInputEntity product) {
    _trackInteraction(
      type: InteractionType.addToFavorites,
      productId: product.code,
      additionalData: {
        'productName': product.name,
        'price': product.price,
      },
    );
  }

  /// Track removing a product from favorites
  void trackRemoveFromFavorites(ProductInputEntity product) {
    _trackInteraction(
      type: InteractionType.removeFromFavorites,
      productId: product.code,
    );
  }

  /// Track adding a product to cart
  void trackAddToCart(ProductInputEntity product) {
    _trackInteraction(
      type: InteractionType.addToCart,
      productId: product.code,
      additionalData: {
        'productName': product.name,
        'price': product.price,
      },
    );
  }

  /// Track removing a product from cart
  void trackRemoveFromCart(ProductInputEntity product) {
    _trackInteraction(
      type: InteractionType.removeFromCart,
      productId: product.code,
    );
  }

  /// Track a search query
  void trackSearch(String query) {
    _trackInteraction(
      type: InteractionType.search,
      additionalData: {'query': query},
    );
  }

  /// Track a checkout event
  void trackCheckout(double totalAmount, List<ProductInputEntity> products) {
    _trackInteraction(
      type: InteractionType.checkout,
      additionalData: {
        'totalAmount': totalAmount,
        'productCount': products.length,
        'products': products.map((p) => p.code).toList(),
      },
    );
  }

  /// General method to track any interaction
  void _trackInteraction({
    required InteractionType type,
    String? productId,
    Map<String, dynamic>? additionalData,
  }) {
    final event = InteractionEvent(
      userId: getUserId(),
      type: type,
      productId: productId,
      additionalData: additionalData,
    );

    // Store locally
    _storeInteraction(event);

    // Log event (in debug mode)
    if (kDebugMode) {
      print('Analytics Event: ${event.type} - ${event.toJson()}');
    }

    // In a real app, you might also send to a server or analytics platform here
  }

  /// Store interaction in local storage
  void _storeInteraction(InteractionEvent event) {
    try {
      // Get existing interactions
      List<dynamic> rawInteractions = [];
      String storedData = Prefs.getString(_interactionsKey);

      if (storedData.isNotEmpty) {
        rawInteractions = jsonDecode(storedData);
      }

      // Add new interaction
      List<Map<String, dynamic>> interactions =
          rawInteractions.map((e) => e as Map<String, dynamic>).toList();

      // Limit the size of stored interactions
      if (interactions.length >= _maxStoredInteractions) {
        interactions.removeAt(0); // Remove oldest
      }

      interactions.add(event.toJson());

      // Save back to storage
      Prefs.setString(_interactionsKey, jsonEncode(interactions));
    } catch (e) {
      if (kDebugMode) {
        print('Error storing interaction: $e');
      }
    }
  }

  /// Get all stored interactions
  List<InteractionEvent> getAllInteractions() {
    try {
      String storedData = Prefs.getString(_interactionsKey);
      if (storedData.isEmpty) {
        return [];
      }

      List<dynamic> rawInteractions = jsonDecode(storedData);
      return rawInteractions.map((e) => InteractionEvent.fromJson(e)).toList();
    } catch (e) {
      if (kDebugMode) {
        print('Error retrieving interactions: $e');
      }
      return [];
    }
  }

  /// Clear all stored interactions
  void clearInteractions() {
    Prefs.setString(_interactionsKey, '');
  }
}
