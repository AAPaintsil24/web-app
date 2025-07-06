# 1️⃣ Use Maven to build your Java app
FROM maven:3.9.6-eclipse-temurin-17 AS builder

# Set workdir
WORKDIR /app

# Copy your project files (src, pom.xml, etc.)
COPY . .

# Run Maven build (creates a WAR file)
RUN mvn clean package

# 2️⃣ Use Tomcat to deploy the built app
FROM tomcat:9.0-jdk17-temurin

# Remove default webapps (optional)
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy WAR file from the build stage into Tomcat
COPY --from=builder /app/target/web-app.war /usr/local/tomcat/webapps/ROOT.war

# Expose Tomcat default port
EXPOSE 8080


