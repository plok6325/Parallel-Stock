function [ name ] = chn2code( stock)
%��ƺʹ���Ļ���ת�� ����ʱ���� U ���»���


if ~iscell(stock)
    display('���»�����,��ȷ����wind Ȩ��');
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
        if strcmp(stock{1},'����')
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
        if strcmp(stock{1},'����')
            name(1)=[];
        end
        
        
    end
    
end

end

