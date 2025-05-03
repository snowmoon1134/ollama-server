# ollama-server

## how to use

```
# build
docker build -t ollama-server .

# run
docker run --rm -it -p 8080:8080 ollama-server

# call endpoint
curl http://localhost:8080/api/chat -d '{"model": "deepseek-r1:1.5b-qwen-distill-q4_K_M", "messages": [{"role": "user", "content": "こんにちわ！"}]}'
```

- pre_download_models.txt
    - ここにollamaのモデル名を記載しておくと、docker build時にダウンロードする
- additional_download_models.txt
    - ここにollamaのモデル名を記載しておくと、docker runして起動した後にダウンロードする

## NVIDIA GPUを利用して推論

NVIDIA Container Toolkitを事前導入した上で、--gpusオプションをつけて起動すればOK

```
docker run --rm -it -p 8080:8080 --gpus=all ollama-server
```