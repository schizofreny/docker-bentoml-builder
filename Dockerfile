FROM python:3.8.14

RUN apt update && \
  apt-get upgrade -y && \
  apt install -y jq ffmpeg libsm6 libxext6 wget gcc buildah && \
  wget https://github.com/moby/buildkit/releases/download/v0.11.1/buildkit-v0.11.1.linux-amd64.tar.gz && \
  tar -xvzf buildkit-v0.11.1.linux-amd64.tar.gz && \
  chmod +x ./bin/buildctl && \
  cp ./bin/* /usr/local/bin && \
  rm -rf ./bin && \
  pip install bentoml==1.0.13 onnx==1.13.0 onnxruntime==1.13.1 mlflow==2.1.1 boto3==1.26.44 && \
  rm -rf /var/lib/apt/lists/*
