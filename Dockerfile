
# Giai đoạn 1: Build project bằng Maven và JDK 21
FROM maven:3.9-eclipse-temurin-21 AS build

WORKDIR /app

# Copy cấu hình Maven
COPY pom.xml .

# Copy source code
COPY src ./src

# Build file WAR
RUN mvn clean package -DskipTests


# Giai đoạn 2: Chạy ứng dụng bằng Tomcat 10.1
FROM tomcat:10.1-jdk21-temurin

# Xóa các ứng dụng mẫu mặc định
RUN rm -rf /usr/local/tomcat/webapps/*

# Đổi cổng Tomcat sang 10000 cho Render
RUN sed -i 's/port="8080"/port="10000"/' \
    /usr/local/tomcat/conf/server.xml

# Copy file WAR từ giai đoạn build
COPY --from=build /app/target/*.war \
    /usr/local/tomcat/webapps/ROOT.war

EXPOSE 10000

CMD ["catalina.sh", "run"]
