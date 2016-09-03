function [ realprice ] = mergeindex( str,start_date,end_date,yes)
%  指数数据加入到today price 第一列。
if yes==1 

load([str,'.mat'])
timestamp_1=timestamp;
realprice_1=realprice;
trade_date_1=trade_date;
index=1:length(trade_date);
 result_s=(trade_date_1==start_date);
 
while sum(result_s)~=1 % validation test 
    start_date=start_date+1;
     result_s=(trade_date_1==start_date);
end
  result_e=(trade_date_1==end_date);
while sum(result_e)~=1 % validation test 
    end_date=end_date-1;
    result_e=(trade_date_1==end_date);
end

date_result_s=index(result_s);
date_result_e=index(result_e);
realprice_topic=realprice_1(date_result_s(1)*240-238:date_result_e(1)*240+1,:);

load('指数.mat');

timestamp_1=timestamp;
realprice_1=realprice;
trade_date_1=trade_date;
index=1:length(trade_date);
result_s=(trade_date_1==start_date);
result_e=(trade_date_1==end_date);
date_result_s=index(result_s);
date_result_e=index(result_e);
realprice_index=realprice_1(date_result_s(1)*240-238:date_result_e(1)*240+1,:);
realprice_index=mean(realprice_index,2);
realprice=[realprice_index realprice_topic];
elseif yes==2
    load([str,'.mat'])
timestamp_1=timestamp;
realprice_1=realprice;
trade_date_1=trade_date;
index=1:length(trade_date);
 result_s=(trade_date_1==start_date);
 
while sum(result_s)~=1 % validation test 
    start_date=start_date+1;
     result_s=(trade_date_1==start_date);
end
  result_e=(trade_date_1==end_date);
while sum(result_e)~=1 % validation test 
    end_date=end_date-1;
    result_e=(trade_date_1==end_date);
end

date_result_s=index(result_s);
date_result_e=index(result_e);
realprice_topic=realprice_1(date_result_s(1)*240-238:date_result_e(1)*240+1,:);
realprice=[repmat(0,length(realprice_topic(:,1)),1) realprice_topic]    ;
    
    
    
end

