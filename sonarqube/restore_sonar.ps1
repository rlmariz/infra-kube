$PathBackup = "E:/Docker/sonarqube/backup_sonar"

docker run --rm --volumes-from sonarqube -v ${PathBackup}:/backup ubuntu tar xvf /backup/sonar_conf.tar 
docker run --rm --volumes-from sonarqube -v ${PathBackup}:/backup ubuntu tar xvf /backup/sonar_data.tar
docker run --rm --volumes-from sonarqube -v ${PathBackup}:/backup ubuntu tar xvf /backup/sonar_extensions.tar
docker run --rm --volumes-from sonarqube -v ${PathBackup}:/backup ubuntu tar xvf /backup/sonar_logs.tar

docker cp sonar-restore.sql postgres_sonarqube:/sonar-restore.sql
docker exec -i postgres_sonarqube psql -U postgres -c "SELECT pg_terminate_backend(pid)FROM pg_stat_activity WHERE datname = 'sonar'"
docker exec -i postgres_sonarqube dropdb -U postgres -W sonar
docker exec -i postgres_sonarqube createdb -U postgres sonar
docker exec -i postgres_sonarqube psql -U postgres -d sonar -f sonar-restore.sql