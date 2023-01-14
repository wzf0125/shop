FROM openjdk:18-jdk-alpine
RUN apk add tzdata
ENV TZ Asia/Shanghai
COPY target/*.jar SHOP.JAR
EXPOSE 8080
VOLUME ["/opt/log"]
ENTRYPOINT ["java","-jar","SHOP.JAR"]
