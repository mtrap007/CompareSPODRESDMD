function [] = dmd_table(dmd,nout,fs)
%% Creates a table of important DMD values
%% ordered in terms of smallest residual

if nargin==2
 fs = 12;
end

[m2, jj] = unique(abs(dmd.dlam)); jj = flipud(jj);


nm = min(numel(jj),60);

temp = dmd.dlam(jj(1:nm));

theta = angle(temp);
jk = find(abs(theta) > 1e-4);

per = zeros(size(theta));
per(jk) = 2*pi./(fs*theta(jk));

d = [ [jj(1:nm)]  abs(temp) theta per];

jt =  jj(1:nm);
[B,ii] = sort(dmd.res(jt)');

ii = ii(1:nout);

% Example data
ModeNumber = jt(ii);
Amplitude = abs(temp(ii));
Period = per(ii);
Residual = B(1:nout); % Column of floating-point numbers

% Create table with column headings
dataTable = table(ModeNumber, Amplitude, Period, Residual, ...
    'VariableNames', {'ModeNumber', 'Amplitude', 'Period', 'Residual'});
% Display the table
disp(dataTable);


return
end
