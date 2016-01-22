function [er, bad] = cnntest(net, x, y)
    %  feedforward
    net = cnnff(net, x);
    disp(net.o);
    [~, h] = max(net.o);
    [~, a] = max(y);
    if(max(net.o)>0.7)
    bad = find(h ~= a);
    er = numel(bad) / size(y, 2);
    else
        bad = find(h ~= a);
        er = 1;
    end
        
end
