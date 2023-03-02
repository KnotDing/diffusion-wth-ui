FROM debian
RUN apt update \
	&& apt install -y wget git python3 python3-venv\
	&& rm /bin/sh && ln -s /bin/bash /bin/sh \
	&& groupadd -r aiart && useradd -r -g aiart aiart \
	&& mkdir /home/aiart && chown -R aiart: /home/aiart
USER aiart
WORKDIR /home/aiart
RUN bash <(wget -qO- https://raw.githubusercontent.com/AUTOMATIC1111/stable-diffusion-webui/master/webui.sh) --exit --no-download-sd-model --skip-torch-cuda-test
CMD ["sh","-c","bash <(wget -qO- https://raw.githubusercontent.com/AUTOMATIC1111/stable-diffusion-webui/master/webui.sh) --listen"]
