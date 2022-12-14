%% SAVES ALL VARIABLES REQUIRED TO RESTART CNMF-E LATER, USING LOAD_CNMFE.M
%Grace Paquelet, 2017

%% save Ysignal
outfilename = ['Ysignal_' file_nm '.tif'];
Ysignal = uint16(Ysignal);
Ysignal = reshape(Ysignal,neuron.options.d1,neuron.options.d2,size(neuron.C,2));
imwrite(Ysignal(:,:,1),outfilename);
for i = 2:size(Ysignal,3)
    loop_track('Writing background subtracted movie, frame #...',i,100);
    imwrite(Ysignal(:,:,i),outfilename,'writemode','append');
end
fprintf('\n')
disp('Done!')

%% generate Yac if not present
if ~exist('Yac','var')
    Yac = neuron.A*neuron.C;
    Yac = reshape(Yac,d1,d2,numFrame);
end

%% save Yac
outfilename = ['Yac_' file_nm '.tif'];
Yac = uint16(Yac);
imwrite(Yac(:,:,1),outfilename);
for i = 2:size(Yac,3)
    loop_track('Writing denoised movie, frame #...',i,100);
    imwrite(Yac(:,:,i),outfilename,'writemode','append');
end
fprintf('\n')
disp('Done!')

%% save standard deviation projections
outfilename = ['std_Ysignal_' file_nm '.tif'];
std_Ysignal = std_projection(Ysignal);
std_Ysignal = uint16(std_Ysignal.*1000);
imwrite(std_Ysignal,outfilename);

outfilename = ['std_Yac_' file_nm '.tif'];
std_Yac = std_projection(Yac);
std_Yac = uint16(std_Yac.*1000);
imwrite(std_Yac,outfilename);

%% clear large files
clear Ysignal & Y & Ybg & Yac

%% save workspace
save(['workspace_' file_nm '.mat']);

%% save neuron structure
clearvars -except neuron & filenames & f & file_nm
save(['neuron_' file_nm '.mat'],'neuron');