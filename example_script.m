%% Add Paths to matlab tools
cd ../Matlab
startup
cd ../QG_Data

%%Now load some data:
q11 = reshape(real(squeeze(ncread('vars1100.nc','q'))),513^2,[]);

%%Now Do some SPOD_ing (and time it)
 %% transpose bc it wants time first 


%%%% Maybe better way to export matlab figures to papers?
% exportgraphics(gcf,'IC_64_zeta.png')
