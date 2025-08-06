# Continuwuity Element Call Troubleshooting Guide

## Common Issues & Solutions

### 1. Video Calling Not Working

**Symptom**: Element Call shows video preview but video disappears after clicking "Join"

**Solution**:
1. Ensure federation is enabled: `ALLOW_FEDERATION=true`
2. Verify TURN server credentials are configured
3. Check that WebRTC ports are open (50000-50200/udp)

**Architecture**: Continuwuity provides TURN server discovery via environment variables. LiveKit handles media routing without needing TURN server configuration.

### 2. JWT Authentication Errors

**Symptom**: 
```
Failed to look up user info: HTTP 403 : {"errcode":"M_FORBIDDEN","error":"M_FORBIDDEN: Federation is disabled."}
```

**Solution**: Enable federation in Matrix server environment:
```bash
CONDUIT_ALLOW_FEDERATION=true
```

### 3. WebRTC Connection Issues

**Symptom**: 
```
removing participant without connection {"connectionType": "unknown"}
```

**Solution**: 
1. Verify LiveKit configuration is simplified (no embedded TURN servers)
2. Ensure Coturn is properly configured with shared secret authentication
3. Check that ports are properly exposed

### 4. TURN Server Credential Errors

**Symptom**:
```
Error: Both username and credential are required when the URL scheme is "turn" or "turns"
```

**Solution**: Don't configure TURN servers directly in LiveKit. Let Matrix server handle TURN discovery via `CONDUIT_TURN_URIS`.

## Working Architecture

```
Element Call Client
├── WebRTC Media ──→ LiveKit (Media Routing)
├── Authentication ──→ LiveKit JWT Service  
├── TURN Discovery ──→ Matrix Server (Continuwuity)
└── TURN Relay ──→ Coturn (when needed)
```

**Key Principle**: Each component has a single responsibility. Don't configure TURN servers in multiple places.

## Port Requirements

- **LiveKit**: 7880 (HTTP), 7881 (HTTPS), 50000-50200/udp (WebRTC)
- **Coturn**: 3478 (STUN/TURN), 5349 (TURNS), 49152-65535/udp (Relay)
- **Matrix**: 6167 (HTTP API)

## Configuration Validation

**LiveKit should be simple**:
```yaml
port: 7880
rtc:
  tcp_port: 7881
  port_range_start: 50000
  port_range_end: 50200
# NO TURN servers configured here!
```

**Matrix handles TURN discovery**:
```bash
CONDUIT_TURN_URIS='["turn:${APP_DOMAIN}:3478?transport=udp","turn:${APP_DOMAIN}:3478?transport=tcp"]'
CONDUIT_TURN_SECRET=${TURN_SECRET}
```

## Success Indicators

**JWT Service Logs**:
```
Got Matrix user info for @user:domain.com (full access)
Created LiveKit room sid: RM_xxxxx
```

**LiveKit Logs**:
```
participant active {"connectionType": "udp"}  
mediaTrack published {"kind": "audio", "mime": "audio/opus"}
mediaTrack published {"kind": "video", "width": 1280, "height": 720}
```

For detailed troubleshooting, see the comprehensive session documentation in memory-bank.