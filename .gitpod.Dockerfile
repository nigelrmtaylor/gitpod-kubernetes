FROM gitpod/workspace-base:latest

ARG KUBECTL_VERSION=v1.22.2

# install doctl
RUN cd ~ && \
    wget https://github.com/digitalocean/doctl/releases/download/v1.82.0/doctl-1.82.0-linux-amd64.tar.gz && \
    tar xf ~/doctl-1.82.0-linux-amd64.tar.gz && \
    sudo mv ~/doctl /usr/local/bin

# install kubectl
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl && \
    sudo mv ./kubectl /usr/local/bin/kubectl && \
    mkdir ~/.kube

# install helm
RUN curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 && \
    chmod 700 get_helm.sh && \
    ./get_helm.sh 

#RUN set -x; cd "$(mktemp -d)" && \
#    OS="$(uname | tr '[:upper:]' '[:lower:]')" && \
#    ARCH="$(uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/')" && \
#    curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/krew.tar.gz" && \
#    tar zxvf krew.tar.gz && \
#    KREW=./krew-"${OS}_${ARCH}" && \
#    "$KREW" install krew && \
#    echo 'export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"' >> /home/gitpod/.bashrc
