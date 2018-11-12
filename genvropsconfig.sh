
echo "adapterkey,adapterKind,resourceKind,credentialId,collectorId,name,description,active_query_count,active_wait_time_count,connection_pool_size,exclude_events,exclude_log_based_events,host,instance,port,query_count,ssl_config,support_autodiscovery,thread_pool_size,thread_timeout,use_ntlm_v2,wait_time_count" > vropsconfigtoimport.csv

grep valid authsqlnodes.txt | while read line ; do
   addr=$(echo ${line} | awk ' { print $1; } ')
 GENLINE=",SqlServerAdapter,SqlServerAdapterInstance,389c7eef-d917-4161-83f1-b3adfc97b05d,1,${addr} system,,10,10,16,False,False,${addr},MSSQLSERVER,,100,No Verify,True,16,30,False,100"
 echo ${GENLINE}

 done >> vropsconfigtoimport.csv

./vropscli createAdapterInstances vropsconfigtoimport.csv
