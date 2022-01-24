FROM ubuntu:latest

RUN apt -y update && apt -y upgrade

RUN apt -y install git python2 python3 curl zsh vim && chsh -s $(which zsh)

SHELL ["/bin/zsh", "-c"]

RUN echo y | sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# 设定 zsh 默认主题为 simple, 并进行应用
RUN sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="simple"/g' ~/.zshrc && source ~/.zshrc

# 安装 zsh suggest-complete 并进行应用
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
RUN sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions)/g' ~/.zshrc && source ~/.zshrc
