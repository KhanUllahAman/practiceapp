// import 'dart:developer';
// import 'package:orioconnect/core/network/api_endpoints.dart';
// import 'package:orioconnect/core/storage/secure_storage_service.dart';
// import 'package:socket_io_client/socket_io_client.dart' as socket_io;

// class ChatSocketService {
//   static final ChatSocketService _instance = ChatSocketService._internal();
//   factory ChatSocketService() => _instance;
//   ChatSocketService._internal();

//   socket_io.Socket? _socket;
//   int? _activeConversationId;
//   final List<Function(dynamic)> _messageListeners = [];
//   final List<Function(dynamic)> _deleteListeners = [];
//   final List<Function(dynamic)> _readReceiptListeners = [];
//   final List<Function(dynamic)> _typingStartListeners = [];
//   final List<Function(dynamic)> _typingStopListeners = [];

//   bool get isConnected => _socket?.connected ?? false;
//   int? get activeConversationId => _activeConversationId;

//   Future<void> initSocket() async {
//     final token = await SecureStorageService.getToken();
//     if (token == null || token.isEmpty) {
//       log('[ChatSocketService] No auth token found. Skipping socket init.');
//       return;
//     }

//     if (_socket != null && _socket!.connected) {
//       log('[ChatSocketService] Socket already connected.');
//       return;
//     }

//     _socket?.dispose();

//     try {
//       log('[ChatSocketService] Initializing socket connection to ${ApiConstants.socketUrl}...');
//       _socket = socket_io.io(
//         ApiConstants.socketUrl,
//         socket_io.OptionBuilder()
//             .setTransports(['websocket'])
//             .setAuth({'token': token})
//             .enableReconnection()
//             .setReconnectionDelay(1000)
//             .setReconnectionDelayMax(5000)
//             .build(),
//       );

//       _socket!.onConnect((_) {
//         log('[ChatSocketService] Socket connected successfully. Socket ID: ${_socket?.id}');
//         if (_activeConversationId != null) {
//           log('[ChatSocketService] Rejoining conversation $_activeConversationId after reconnect');
//           _socket!.emit('conversation:join', _activeConversationId);
//         }
//       });

//       _socket!.onConnectError((err) {
//         log('[ChatSocketService] Connection error: $err');
//       });

//       _socket!.onError((err) {
//         log('[ChatSocketService] Socket error: $err');
//       });

//       _socket!.onDisconnect((reason) {
//         log('[ChatSocketService] Socket disconnected: $reason');
//       });

//       _socket!.on('message:new', (data) {
//         log('[ChatSocketService] Realtime message:new event received: $data');
//         for (final listener in List.from(_messageListeners)) {
//           try {
//             listener(data);
//           } catch (e) {
//             log('[ChatSocketService] Error in message listener: $e');
//           }
//         }
//       });

//       _socket!.on('message:deleted', (data) {
//         log('[ChatSocketService] Realtime message:deleted event: $data');
//         for (final listener in List.from(_deleteListeners)) {
//           try {
//             listener(data);
//           } catch (e) {
//             log('[ChatSocketService] Error in delete listener: $e');
//           }
//         }
//       });

//       _socket!.on('receipt:read', (data) {
//         log('[ChatSocketService] Realtime receipt:read event: $data');
//         for (final listener in List.from(_readReceiptListeners)) {
//           try {
//             listener(data);
//           } catch (e) {
//             log('[ChatSocketService] Error in read receipt listener: $e');
//           }
//         }
//       });

//       _socket!.on('typing:start', (data) {
//         log('[ChatSocketService] Realtime typing:start event: $data');
//         for (final listener in List.from(_typingStartListeners)) {
//           try {
//             listener(data);
//           } catch (e) {
//             log('[ChatSocketService] Error in typing:start listener: $e');
//           }
//         }
//       });

//       _socket!.on('typing:stop', (data) {
//         log('[ChatSocketService] Realtime typing:stop event: $data');
//         for (final listener in List.from(_typingStopListeners)) {
//           try {
//             listener(data);
//           } catch (e) {
//             log('[ChatSocketService] Error in typing:stop listener: $e');
//           }
//         }
//       });
//     } catch (e) {
//       log('[ChatSocketService] Error creating socket: $e');
//     }
//   }

//   void joinConversation(int conversationId) {
//     _activeConversationId = conversationId;
//     if (_socket != null && _socket!.connected) {
//       log('[ChatSocketService] Emitting conversation:join for ID $conversationId');
//       _socket!.emit('conversation:join', conversationId);
//     } else {
//       log('[ChatSocketService] Socket not connected yet, initializing before join...');
//       initSocket().then((_) {
//         if (_socket != null && _socket!.connected) {
//           _socket!.emit('conversation:join', conversationId);
//         }
//       });
//     }
//   }

//   void leaveConversation(int conversationId) {
//     if (_activeConversationId == conversationId) {
//       _activeConversationId = null;
//     }
//     if (_socket != null && _socket!.connected) {
//       log('[ChatSocketService] Emitting conversation:leave for ID $conversationId');
//       _socket!.emit('conversation:leave', conversationId);
//     }
//   }

//   void addMessageListener(Function(dynamic) onMessage) {
//     if (!_messageListeners.contains(onMessage)) {
//       _messageListeners.add(onMessage);
//     }
//   }

//   void removeMessageListener(Function(dynamic) onMessage) {
//     _messageListeners.remove(onMessage);
//   }

//   void addDeleteListener(Function(dynamic) onDelete) {
//     if (!_deleteListeners.contains(onDelete)) {
//       _deleteListeners.add(onDelete);
//     }
//   }

//   void removeDeleteListener(Function(dynamic) onDelete) {
//     _deleteListeners.remove(onDelete);
//   }

//   void addReadReceiptListener(Function(dynamic) onReadReceipt) {
//     if (!_readReceiptListeners.contains(onReadReceipt)) {
//       _readReceiptListeners.add(onReadReceipt);
//     }
//   }

//   void removeReadReceiptListener(Function(dynamic) onReadReceipt) {
//     _readReceiptListeners.remove(onReadReceipt);
//   }

//   void emitTypingStart(int conversationId) {
//     if (_socket != null && _socket!.connected) {
//       log('[ChatSocketService] Emitting typing:start for ID $conversationId');
//       _socket!.emit('typing:start', conversationId);
//     }
//   }

//   void emitTypingStop(int conversationId) {
//     if (_socket != null && _socket!.connected) {
//       log('[ChatSocketService] Emitting typing:stop for ID $conversationId');
//       _socket!.emit('typing:stop', conversationId);
//     }
//   }

//   void addTypingStartListener(Function(dynamic) onTypingStart) {
//     if (!_typingStartListeners.contains(onTypingStart)) {
//       _typingStartListeners.add(onTypingStart);
//     }
//   }

//   void removeTypingStartListener(Function(dynamic) onTypingStart) {
//     _typingStartListeners.remove(onTypingStart);
//   }

//   void addTypingStopListener(Function(dynamic) onTypingStop) {
//     if (!_typingStopListeners.contains(onTypingStop)) {
//       _typingStopListeners.add(onTypingStop);
//     }
//   }

//   void removeTypingStopListener(Function(dynamic) onTypingStop) {
//     _typingStopListeners.remove(onTypingStop);
//   }

//   void disconnect() {
//     _socket?.disconnect();
//     _socket?.dispose();
//     _socket = null;
//     _activeConversationId = null;
//   }
// }
