FROM maven:3.5.4-alpine
VOLUME /tmp
#从src目录复制文件到容器的dest
ADD . /app
WORKDIR /app/
RUN mvn clean package
#设置时区
RUN echo "Asia/Shanghai" > /etc/timezone
RUN ln -snf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
#指定Docker容器启动时执行的命令，可以多次设置，但是只有最后一个有效。
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","target/demo1-1.0.0.jar"]
EXPOSE 9090
#为Docker容器设置对外的端口号。在启动时，可以使用-p选项或者-P选项。
