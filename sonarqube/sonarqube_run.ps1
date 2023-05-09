#docker run --rm -p 9000:9000 -v sonarqube_conf:/opt/sonarqube/conf -v sonarqube_extensions:/opt/sonarqube/extensions -v sonarqube_logs:/opt/sonarqube/logs -v sonarqube_data:/opt/sonarqube/data sonarqube:latest

Clear;

docker rm sonarqube 

    #-e "sonar.jdbc.url=jdbc:sqlserver://192.168.0.1:1433;instanceName=SQL2017;databaseName=SonarQube" `
    #-e "sonar.jdbc.url=jdbc:sqlserver://192.168.0.1:49658;databaseName=SonarQube;integratedSecurity=false" `
    #-e sonar.jdbc.password=p@cwin32 `

docker run --name sonarqube `
    -p 9000:9000 `
    -e "sonar.jdbc.url=jdbc:sqlserver://192.168.0.2;databaseName=SonarQube_DataBelli;integratedSecurity=false" `
    -e sonar.jdbc.username=sa `
    -e sonar.jdbc.password=123 `
    -v sonarqube_conf:/opt/sonarqube/conf `
    -v sonarqube_extensions:/opt/sonarqube/extensions `
    -v sonarqube_logs:/opt/sonarqube/logs `
    -v sonarqube_data:/opt/sonarqube/data `
    sonarqube:latest `


# docker run --name sonarqube -p 9000:9000 -e sonar.jdbc.url=jdbc:sqlserver://192.168.0.2/sonar -e sonar.jdbc.username=sa -e sonar.jdbc.password=123 -v sonarqube_conf:/opt/sonarqube/conf -v sonarqube_extensions:/opt/sonarqube/extensions -v sonarqube_logs:/opt/sonarqube/logs -v sonarqube_data:/opt/sonarqube/data sonarqube:latest

# sqlserver://localhost/sonar

# docker run -d --name sonarqube --link sql:sqlserver -p 9000:9000 -p 9092:9092 -e SONARQUBE_JDBC_USERNAME=sa -e SONARQUBE_JDBC_PASSWORD=P@ssw0rd -e “SONARQUBE_JDBC_URL=jdbc:sqlserver://localhost;databaseName=sonarqube;” sonarqube

# sonar.jdbc.url=jdbc:sqlserver://192.168.0.2;databaseName=sonar
# sonar.jdbc.url=jdbc:sqlserver://localhost;databaseName=sonar
# sonar.jdbc.username=sa
# sonar.jdbc.password=123


# Latin1_General_100_CS_AS