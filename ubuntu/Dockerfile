FROM ubuntu:latest

RUN apt -y update && apt -y upgrade

RUN apt -y install git python2 python3 curl zsh vim

# 这一步需要 y 确认，找一种不需要 y 确认的方法
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# 设定 zsh 默认主题为 simple, 并进行应用
RUN sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="simple"/g' /root/.zshrc && source /root/.zshrc

# 安装 zsh suggest-complete 并进行应用
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
RUN sed -i 's/plugins=(git)/plugins=(git\n\tzsh-autosuggestions\n)/g' /root/.zshrc && source /root/.zshrc
