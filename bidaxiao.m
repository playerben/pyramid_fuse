function out = bidaxiao(x,y)

x2 = x(:);
y2 = y(:);
out2 = zeros(size(x2));
for i = 1:size(x2,1)
    if x2(i)>y2(i)
        out2(i) = x2(i);
    else
        out2(i) = y2(i);
    end
end
out = reshape(out2,(size(x)));