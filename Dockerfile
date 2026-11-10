FROM tomcat:10.1-jdk21

# Xóa các trang web mẫu mặc định của Tomcat
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy file war đã build từ máy bạn vào Tomcat và đổi tên thành ROOT.war
COPY target/*.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]