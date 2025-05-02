# ollama-server

## how to use

```
# build
docker build -t ollama-server .

# run
docker run --rm -it -p 8080:8080 ollama-server

# call endpoint
curl http://localhost:8080/api/chat -d '{"model": "deepseek-r1:1.5b-qwen-distill-q4_K_M", "messages": [{"role": "user", "content": "こんにちわ！"}]}'