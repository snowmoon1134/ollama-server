echo "wake up ollama server"
ollama serve &
sleep 10

# pre_download_models.txtからモデル名を読み込んでpullする
while IFS= read -r model; do
    if [ -n "$model" ]; then
        echo "Pulling model: $model"
        ollama pull "$model"
    fi
done < /app/src/pre_download_models.txt
