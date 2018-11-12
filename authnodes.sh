username=${1:?"Must pass a username"}
password=${2:?"Must pass a password"}
domain=${3:?"Must pass a domain"}

for node in $(cat sqlnodes.txt); do 
#	docker run -v $(pwd)/work:/work --rm=true bluemedorapublic/bm-servicediscovery:0.0.2 -oX /work/dbsuccess.xml -p 1433 $node --script ms-sql-query --script-args mssql.instance-port=1433,mssql.domain=BLUEMEDORA,mssql.username=scom_lpu_domain,mssql.password=P@ssw0rd1 > /dev/null 2>&1
	docker run -v $(pwd)/work:/work --rm=true bluemedorapublic/bm-servicediscovery:0.0.2 -oX /work/dbsuccess.xml -p 1433 $node --script ms-sql-query --script-args mssql.instance-port=1433,mssql.domain=${domain},mssql.username=${username},mssql.password=${password} > /dev/null 2>&1
	if echo "cat //nmaprun/host[1]/hostscript/script[@id='ms-sql-query']" | xmllint --shell work/dbsuccess.xml | grep -q ERROR; then
		echo "${node} appears to have SQL database, but creds do not work"
	else
		echo "${node} is valid"
	fi
done

