FROM ollama/ollama

ARG DEPLOY_TARGET=/app/src

ENV OLLAMA_SERVER_PORT=8080

# refer https://ollama.com/library/deepseek-r1/tags
ARG PREINSTALL_MODEL=deepseek-r1:1.5b-qwen-distill-q4_K_M

# pre_download_models.txt に記載してあるモデルは docker build 時にダウンロードしておく
COPY pre_model_downloader.sh ${DEPLOY_TARGET}/pre_model_downloader.sh
COPY pre_download_models.txt ${DEPLOY_TARGET}/pre_download_models.txt
RUN chmod +x ${DEPLOY_TARGET}/pre_model_downloader.sh
RUN ${DEPLOY_TARGET}/pre_model_downloader.sh

# setup entrypoint
COPY entrypoint.sh ${DEPLOY_TARGET}/entrypoint.sh
RUN chmod +x ${DEPLOY_TARGET}/entrypoint.sh

# 起動時に追加でダウンロードしたいモデルがあれば additional_download_models.txt に記載
COPY additional_download_models.txt ${DEPLOY_TARGET}/additional_download_models.txt

ENTRYPOINT ["/app/src/entrypoint.sh"]

