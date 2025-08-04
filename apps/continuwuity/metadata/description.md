# Continuwuity - Enhanced Matrix Homeserver

Continuwuity is a fast, secure, and feature-rich Matrix homeserver implementation written in Rust. It's a fork of Conduit with enhanced features and better Matrix specification compliance.

## Key Features

### 🚀 Enhanced Performance
- **RocksDB Backend**: High-performance, persistent storage
- **Rust Implementation**: Memory-safe and blazingly fast
- **Optimized Federation**: Efficient communication with other Matrix servers

### 👥 Full Presence Support
- **Local Presence**: See when users are online/away/offline
- **Federated Presence**: Share presence with other Matrix servers
- **Real-time Updates**: Instant presence state changes

### 📹 Integrated Video Calling
- **LiveKit Integration**: High-quality video conferencing
- **Element Call Support**: Seamless video calls in Element clients
- **TURN Server**: Built-in WebRTC relay for NAT traversal

### 🔒 Security & Privacy
- **End-to-End Encryption**: Full Matrix E2EE support
- **Secure TURN**: Authenticated WebRTC relay server
- **Federation Controls**: Configurable server trust levels

### 🌐 Network Options
- **Tailscale Integration**: Optional zero-trust mesh networking
- **Custom Domains**: Use your own domain name
- **Traefik Integration**: Automatic HTTPS and reverse proxy

## Perfect For

- **Teams & Organizations**: Replace Slack/Discord with self-hosted Matrix
- **Privacy-Conscious Users**: Full control over your communication data  
- **Video Conferencing**: Built-in video calling without third-party services
- **Federation**: Connect with users on other Matrix servers worldwide

## Matrix Clients

Works with all Matrix clients including:
- **Element**: Web, Desktop, Mobile apps
- **FluffyChat**: Modern mobile client
- **Nheko**: Lightweight desktop client
- **SchildiChat**: Element fork with additional features

## Technical Details

- **Database**: RocksDB for high performance
- **Video**: LiveKit server with Element Call integration
- **TURN**: Coturn server for WebRTC relay
- **Well-known**: Automatic Matrix server discovery
- **Federation**: Full Matrix federation protocol support

Start your own Matrix homeserver today with enhanced presence and video calling!