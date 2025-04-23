#!/bin/bash
wait_time=15s

# wait for SQL Server to come up
echo importing data will start in $wait_time...
sleep $wait_time
echo executing script...

/opt/mssql-tools/bin/sqlcmd -S database -U sa -P Int3Gr@t137 -d master -i /tmp/init-script.sql