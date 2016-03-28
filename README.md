## Springboot with Oracle DB Example

Quick example of using springboot to write a quick REST API to access some stuff in an Oracle database.

### Steps to make this garbage work

#### Prereqs
1. Java 8
2. Maven (because reasons)
3. Vagrant: https://www.vagrantup.com/
4. Clone this repo (duh)

#### Install/Configure Oracle express
1. Oracle xe installer for linux (I don't care if you're running linux or not, this guy is going in a VM): http://www.oracle.com/technetwork/database/database-technologies/express-edition/downloads/index.html
2. Move that guy to `spring-boot-oracle-example/oracle-installer`
3. `vagrant up` _(in the spring-boot-oracle-example dir)_
4. Congrats, oracle xe is installed(ish) on this VM
5. `vagrant ssh`
6. `sudo -i` (act as root)
6. You'll note from the step above after running `vagrant up` you'll see a message, something like ```==> default: You must run '/etc/init.d/oracle-xe configure' as the root user to configure the database.```  So yeah.. do that.
7. Use the default ports.  And take not of the password you provide.
8. `. /u01/app/oracle/product/11.2.0/xe/bin/oracle_env.sh` - Set env variables using the script provided from Oracle.  This is needed to connect using their sql client.
9. `sqlplus /nolog`
10. `connect sys as sysdba`
11. Enter the password you created during config
12. `start /vagrant/create_sql_user_and_tables.sql`

#### Oracle JDBC Driver shenanigans
1. Download the JDBC driver: http://www.oracle.com/technetwork/database/features/jdbc/index-091264.html
2. Here's where things get interesting.  Apparently `gradle` can't load this jar from a `flatFile` repository.  So the workaround is to create a local maven repository and load this 1 jar into it.
3. `cd` to the directory where the ojdbc jar is located
4. `mvn install:install-file -Dfile=ojdbc6.jar  -DgroupId=com.oracle -DartifactId=ojdbc6 -Dversion=11.2.0.4 -Dpackaging=jar`
5. In the above command make sure to adjust the file, artifactId, and version to match the driver you downloaded.
6. If a different version from the one above was used adjust `build.gradle`

#### Run it!
1. `./gradlew bootRun`
2. http://localhost:8080/users