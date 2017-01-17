#!/bin/bash
	 DB_DIR=/home/mysql/data_backup/
	 DB_TARGET_DIR=/home/mysql/linkdb
	 LOG_SOURCE_DIR=/home/mysql/data_backup/
	 LOG_TARGET_DIR=/home/mysql/ssd_log/
	 LINKBENCH_DIR=/home/mysql/linkbench/
#         echo "-CleanUp database:${PAGE_SIZE} ${WORKLOAD_TYPE}" 
#         cleanup_databases ${PAGE_SIZE} ${WORKLOAD_TYPE} ${NOBARRIER${LOG_NOBARRIER}} 
#         echo "-CleanUp database done!:${PAGE_SIZE} ${WORKLOAD_TYPE}" 
# 
#         #startup database first 
#         echo "-Startup MySQL First:${PAGE_SIZE} ${WORKLOAD_TYPE} ${BUFFER_SIZE} ${FLUSH_METHOD} ${DW_SWITCH}" 
#         startup_database ${PAGE_SIZE} ${WORKLOAD_TYPE} ${BUFFER_SIZE} ${FLUSH_METHOD} ${DW_SWITCH} 16 8 ${BUFFER_POOL_INSTANCES} 
# 
#         echo "-Make sure stop stat collector" 
#         bash ${HOME}/iobench_stat.sh --stop          
#         echo "-Start stat collect collector" 
#         bash ${HOME}/iobench_stat.sh --outdir ${stat_path}/P-${PAGE_SIZE}_W-${WORKLOAD_TYPE}_B-${BUFFER_SIZE}_F-${FLUSH_METHOD}_DW-${DW_SWITCH} --sample 1 
# 
#         report_result ${PAGE_SIZE} ${WORKLOAD_TYPE} ${BUFFER_SIZE} ${FLUSH_METHOD} ${DW_SWITCH}  
# 
#         start_monitor ${PAGE_SIZE} 
# 
#         echo "-Run LinkBench" 
# 
#         if [ "$WORKLOAD_TYPE" == "MIX" ]; then 
#           LINKBENCH_CONFIG=${LINKBENCH_DIR}/config/MyConfig.properties 
#         else   
#           LINKBENCH_CONFIG=${LINKBENCH_DIR}/config/MyConfig_${WORKLOAD_TYPE}only.properties 
#         fi 
# 
#         cd ${LINKBENCH_DIR} 
#         ./bin/linkbench -c ${LINKBENCH_CONFIG} -r  
#         cd ${HOME}  
# 
#         stop_monitor ${PAGE_SIZE} ${WORKLOAD_TYPE} ${BUFFER_SIZE} ${FLUSH_METHOD} ${DW_SWITCH}  
# 
#         echo "-Make sure stop stat collector" 
#         ./iobench_stat.sh --stop           
# 
#         echo "-Database is going to shutdown!" 
#         shutdown_database ${PAGE_SIZE} ${WORKLOAD_TYPE} 
# 
#         echo "-Run LinkBench done!" 
#       done #end of DW SWITCH 
#     done #end of flush_method 
#   done #end of buffer size 
# done  #end of workload type 
# echo "-Delete Current Database : ${PAGE_SIZE}" 
##delete_databases ${PAGE_SIZE} 
#done #end of page size 
# 
##final report 
#report_result ${PAGE_SIZE} ${WORKLOAD_TYPE} ${BUFFER_SIZE} ${FLUSH_METHOD} ${DW_SWITCH}  
	 -- VISUAL LINE --                                                                                                                                                                               532,1         Bot
