function out = make_dmd_nosvd(in,mmax,nout);
% function out = make_dmd_nosvd(in,mmax);
% Given ANY nx x nt data in X, get DMD, truncating at mmax to get mmax POD
% modes

if nargin==2
  nout = mmax;
end

X1 = in.X;
X2 = in.Y;

r = [1:mmax];

U = in.U(:,r); S = in.S(r,r); V = in.V(:,r);
Atilde = U'*X2*V*inv(S);
[W,eigs] = eig(Atilde);
Phi = X2*V*inv(S)*W;
dlam = diag(eigs);

%Get residuals!
M1 = V * inv(S);
L = ctranspose(X2*M1)*X2*M1;
for ii = 1:mmax
  ww = W(:,ii);
  res(ii) = ctranspose(ww)*L*ww - abs(dlam(ii))^2;
end


%Reorder the DMD in /least outdecaying/:

[B,ii] = sort(abs(dlam),'descend');

ii = ii(1:nout);

out.dlam = dlam(ii);
out.res = real(res(ii));
out.Phi = Phi(:,ii);

 
return
end


