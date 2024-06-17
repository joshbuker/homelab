# Automatic1111 Stable Diffusion Web UI

For local testing of Stable Diffusion.

## Installation

### Download Repo

Clone the repo or copy this folder directly.

### Download model(s)

Then, you will need to add at least one checkpoint model to the `model/checkpoints` folder.

Checkpoints can be found on various platforms such as:
- [HuggingFace](https://huggingface.co/models?pipeline_tag=text-to-image)
- [CivitAI](https://civitai.com/models)
- [Replicate](https://replicate.com/collections/text-to-image)
- [Other Alternatives...](https://alternativeto.net/software/hugging-face/)

For security, ensure that any model checkpoints you download are in the `.safetensors` format. Otherwise, malicious models can run arbitrary code on your computer, which is highly dangerous.

### Install Docker

Install Docker Desktop to be able to run the compose file locally, or install Docker using your existing methods.

https://docs.docker.com/desktop/

### Install Nvidia Container Toolkit

To give Stable Diffusion access to the GPU, you'll need to install the nvidia container toolkit.

1. Configure the repository. Arch users, skip to step 2.

```sh
curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey \
    | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg
curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list \
    | sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' \
    | sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list
sudo apt-get update
```

2. Install the NVIDIA Container Toolkit packages

```sh
sudo apt-get install -y nvidia-container-toolkit
# or, for Arch:
sudo pacman -Syu nvidia-container-toolkit
```

3. Configure Docker to use Nvidia driver

```sh
sudo nvidia-ctk runtime configure --runtime=docker
sudo systemctl restart docker
```

## Usage

To use, from this folder execute `./run.sh`, or manually bring the compose up with:

```sh
# Update image to latest
docker compose pull

# Run container
docker compose up
```

The service should now be running on `http://localhost:7860` and can be opened with your default web browser.

To exit, use `ctrl+c`
