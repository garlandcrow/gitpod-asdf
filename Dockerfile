FROM gitpod/workspace-base

ENV DEBIAN_FRONTEND=nonintercative

ARG asdf_ver="0.10.2"

RUN sudo apt-get update && \
  # asdf deps
  sudo apt-get install -y curl git && \
  # erlang deps
  sudo apt-get install -y build-essential autoconf m4 libncurses5-dev libwxgtk3.0-gtk3-dev libwxgtk-webview3.0-gtk3-dev libgl1-mesa-dev libglu1-mesa-dev libpng-dev libssh-dev unixodbc-dev xsltproc fop libxml2-utils libncurses-dev openjdk-11-jdk && \
  # install asdf
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v${asdf_ver} && \
  echo ". $HOME/.asdf/asdf.sh" >> ~/.bashrc && \
  echo ". $HOME/.asdf/completions/asdf.bash" >> ~/.bashrc

COPY .tool-versions install_asdf_plugins.sh /home/gitpod/

RUN bash -c ". $HOME/.asdf/asdf.sh && ~/install_asdf_plugins.sh" && \
  rm -rf /home/gitpod/install_asdf_plugins.sh

RUN cd && \
  bash -c ". $HOME/.asdf/asdf.sh && asdf install" && \
  rm -rf ~/.tool-versions
