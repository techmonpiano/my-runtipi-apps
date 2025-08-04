#!/bin/bash
set -euo pipefail

# Generate required secrets if they don't exist
if [ -z "${TURN_SECRET:-}" ]; then
    export TURN_SECRET=$(openssl rand -hex 32)
    echo "Generated TURN_SECRET: [REDACTED]"
fi

if [ -z "${LIVEKIT_API_KEY:-}" ]; then
    export LIVEKIT_API_KEY="lk$(openssl rand -hex 8)"
    echo "Generated LIVEKIT_API_KEY: $LIVEKIT_API_KEY"
fi

if [ -z "${LIVEKIT_API_SECRET:-}" ]; then
    export LIVEKIT_API_SECRET=$(openssl rand -hex 32)
    echo "Generated LIVEKIT_API_SECRET: [REDACTED]"
fi

# Set default values
export ALLOW_REGISTRATION=${ALLOW_REGISTRATION:-false}
export ALLOW_FEDERATION=${ALLOW_FEDERATION:-true}
export TAILSCALE_HOSTNAME=${TAILSCALE_HOSTNAME:-continuwuity-ts}

# Create data directory
mkdir -p ${APP_DATA_DIR}/data
mkdir -p ${APP_DATA_DIR}/tailscale-state

echo "Continuwuity app configuration completed successfully!"
echo "Matrix server will be available at: https://${APP_DOMAIN}"