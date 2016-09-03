function [ name ] = get_name( stock,datee,w)
%根据代码获取中文简称  输入 (代码， 时间)
%[w_wset,w_wset_codes,w_wset_fields,w_wset_times,w_wset_errorid,w_wset_reqid]=w.wset('sectorconstituent',['date=',datee,';sectorid=a001010100000000']);
load('namestock.mat')
if stock{1}(2)=='0'
name={};
for x=1:length(stock)
s=stock(x);
for y=1:length(w_wset)
[c cn]=w_wset{y,2:3};
if c==stock{x};
name{x}=cn;
end
end
end
else 
    name={};
for x=1:length(stock)
s=stock(x);
for y=1:length(w_wset)
[c cn]=w_wset{y,2:3};
if strcmp(cn,stock{x})
name{x}=c;
end
end
end

end



end

