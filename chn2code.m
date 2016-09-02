function [ name ] = chn2code( stock)
%简称和代码的互相转化 出错时请用 U 更新缓存


if ~iscell(stock)
    display('更新缓存中,请确保有wind 权限');
    update_cache();
else
    
    load('chn2code_cache.mat')
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
        if strcmp(stock{1},'名称')
            st=2;
        else
            st=1;
        end
        for x=st:length(stock)
            s=stock(x);
            for y=1:length(w_wset)
                [c cn]=w_wset{y,2:3};
                if strcmp(cn,stock{x})
                    name{x}=c;
                end
            end
        end
        if strcmp(stock{1},'名称')
            name(1)=[];
        end
        
        
    end
    
end

end

