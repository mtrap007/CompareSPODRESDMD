function [dmd] = do_dmd(data, x)
%function [dmd] = do_dmd(data, x)
%conducts resDMD on your data, x being the how many modes you wish to keep
data = double(data);
in.X = data(:,1:end-1);  
Umean = mean(in.X,2); 
V = in.X - repmat(Umean,1,1920);
in.X = V(:,1:end-1);  
in.Y = V(:,2:end); 
[in.U,in.S,in.V] = svd(in.X,'econ');

dmd = make_dmd_nosvd(in,100); 
dmd.dlam = dmd.dlam(1:x,:);  
dmd.res = dmd.res(:,1:x); 
dmd.Phi = dmd.Phi(:,1:x); 
 save('dmd.mat', 'dmd', '-v7.3'); 
end