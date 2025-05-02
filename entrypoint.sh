#!/bin/bash

# Define cleanup function
cleanup() {
    echo "Container is shutting down..."
    # Add your cleanup code here
    # For example: stop your application gracefully
    
    # If you have a specific process to stop:
    # kill -SIGTERM $APP_PID
    
    exit 0
}


# Trap SIGTERM and SIGINT signals
trap cleanup SIGTERM SIGINT

export OLLAMA_HOST=0.0.0.0:${OLLAMA_SERVER_PORT}
ollama serve &
# Store the PID of ollama appilication
APP_PID=$!

sleep 10

# additional_download_models.txtからモデル名を読み込んでpullする
while IFS= read -r model; do
    if [ -n "$model" ]; then
        echo "Pulling model: $model"
        ollama pull "$model"
    fi
done < /app/src/additional_download_models.txt

# use wait to keep the script running
# and to properly catch signals
wait $APP_PID