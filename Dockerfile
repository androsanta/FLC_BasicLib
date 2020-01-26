FROM ubuntu

WORKDIR /flc
RUN apt-get update && \
    apt-get -y -qq install jflex curl zsh git unzip make
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

COPY tools/ ./tools
RUN cd tools && \
    unzip java_cup_v11_draw_tree.zip && \
    tar xvzf jdk-13.0.2_linux-x64_bin.tar.gz

RUN echo 'export PATH=/flc/tools/jdk-13.0.2/bin:$PATH' >> ~/.zshrc && \
    echo 'export PATH=/flc/tools/java_cup_v11_draw_tree:$PATH' >> ~/.zshrc && \
    echo 'export CLASSPATH=.:/flc/tools/java_cup_v11_draw_tree' >> ~/.zshrc

RUN cd tools/java_cup_v11_draw_tree/java_cup && \
    /flc/tools/jdk-13.0.2/bin/javac *.java runtime/*.java ../StdDraw.java

CMD zsh