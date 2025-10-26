# 🧩 DevOps End-to-End CI/CD Pipeline Project

## Overview
This project demonstrates a complete DevOps CI/CD workflow using **Jenkins**, **SonarQube**, **Nexus**, and **Tomcat**, all deployed on **AWS EC2**. The goal is to automate the build, test, and deployment process for a Java web application.

## 🧠 Technologies Used
- Jenkins for CI/CD
- SonarQube for code quality analysis
- Nexus for artifact storage
- Tomcat for application deployment
- AWS EC2 (Ubuntu)
- Git & GitHub for version control

## ⚙️ Pipeline Workflow
1. Developer pushes code to GitHub
2. Jenkins triggers automatically
3. Jenkins performs build using Maven
4. SonarQube performs code quality analysis
5. Nexus stores the artifact (WAR file)
6. Jenkins deploys the artifact to Tomcat on EC2

## 🏗️ Architecture Diagram
![Architecture](Docs/ci-cd-pipeline-flow.png)

## 📦 Setup Guides
- [Jenkins Setup](Jenkins/setup-guide.md)
- [SonarQube Configuration](SonarQube/sonar-setup.md)
- [Nexus Installation](Nexus/nexus-setup.md)
- [Tomcat Deployment](Tomcat/deployment-guide.md)

## 💡 Lessons Learned
- Integrating tools taught me how to manage end-to-end automation.
- Configuring webhooks between GitHub and Jenkins improved efficiency.
- SonarQube integration reinforced code quality as part of DevOps.

## 📣 Author
**Albert (DevOps Engineer)**  
🌐 [LinkedIn](https://linkedin.com/in/YOUR-LINK) | 📧 albert@example.com
