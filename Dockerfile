#JDK image
FROM openjdk:24

#Bilgilendirme
LABEL maintainer="enesuluc04@gmail.com"

#Ortam değişkenleri
ENV APP_NAME="Spring and Docker"
ENV VERSION="V1.0.0"
ENV PORT="http://localhost:8080"

#Çalıştır
RUN echo "App name: $APP_NAME"
RUN echo "Version: $VERSION"
RUN echo "Port: $PORT"



#Data persist
VOLUME /tmp

#Port
EXPOSE 8080

#Tüm .jar fileleri bul, yeni ismi JAR_FILE olsun
ARG JAR_FILE=*.jar

#Projenin yeni ismi app.jar oldu.
ADD ${JAR_FILE} app.jar 

#Docker container çalışması sırasında varsayılan komutlardır
ENTRYPOINT [ "java","-jar","app.jar" ]

#Container sağlıklı çalışıyor mu?
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 CMD curl --fail http://localhost:8080 || exit 1
