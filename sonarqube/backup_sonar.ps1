$PathBackup = "E:/Docker/sonarqube/backup_sonar"

docker run --rm --volumes-from sonarqube -v ${PathBackup}:/backup ubuntu tar cvf /backup/sonar_conf.tar /opt/sonarqube/conf
docker run --rm --volumes-from sonarqube -v ${PathBackup}:/backup ubuntu tar cvf /backup/sonar_data.tar /opt/sonarqube/data
docker run --rm --volumes-from sonarqube -v ${PathBackup}:/backup ubuntu tar cvf /backup/sonar_extensions.tar /opt/sonarqube/extensions
docker run --rm --volumes-from sonarqube -v ${PathBackup}:/backup ubuntu tar cvf /backup/sonar_logs.tar /opt/sonarqube/logs
docker run --rm --volumes-from postgres_sonarqube -v ${PathBackup}:/backup ubuntu tar cvf /backup/sonar_postgres_data.tar /var/lib/postgresql/data

docker-compose.exe down
docker-compose.exe up -d