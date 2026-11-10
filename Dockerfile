
# =========================
# Stage 1: Build WAR
# =========================
FROM maven:3.9-eclipse-temurin-21 AS build

WORKDIR /app

# Copy pom.xml
COPY pom.xml .

# Copy source code
COPY src ./src

# Build project
RUN mvn clean package -DskipTests


# =========================
# Stage 2: Run Tomcat
# =========================
FROM tomcat:10.1-jdk21

# Xóa ứng dụng mẫu
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy WAR từ Stage 1
COPY --from=build /app/target/*.war \
    /usr/local/tomcat/webapps/ROOT.war

# Render sử dụng cổng 10000
RUN sed -i 's/port="8080"/port="10000"/' \
    /usr/local/tomcat/conf/server.xml

EXPOSE 10000

CMD ["catalina.sh", "run"]
