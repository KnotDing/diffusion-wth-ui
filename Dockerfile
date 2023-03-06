FROM debian
RUN apt update \
        && apt install -y wget git python3 python3-venv python3-pip libgl1-mesa-glx libglib2.0-0\
        && rm /bin/sh && ln -s /bin/bash /bin/sh \
        && groupadd -r aiart && useradd -r -g aiart aiart \
        && mkdir /home/aiart && chown -R aiart: /home/aiart
USER aiart
WORKDIR /home/aiart
RUN git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git \
        && sed -i 's/pip install/pip install --no-cache/g' stable-diffusion-webui/launch.py \
        && stable-diffusion-webui/webui.sh --exit --no-download-sd-model --skip-torch-cuda-test
CMD ["stable-diffusion-webui/webui.sh", "--listen"]
