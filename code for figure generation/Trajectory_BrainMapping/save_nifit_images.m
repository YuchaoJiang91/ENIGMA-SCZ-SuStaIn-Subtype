%% save ROI-wise z scores to nifit images
clear;clc
cd('...\Trajectory_BrainMapping')
[atlas_aal3,header] = y_Read(['inputdata',filesep,'aal3.nii']);


%**************************************
inputfile = importdata(['inputdata',filesep,'inputdata_Unmed_subtype0.csv']);
region_id = inputfile.data(:,1);
zscores = inputfile.data(:,2:end);
[number_roi, number_stage] = size(zscores);
for k = 1:number_stage
    data = zeros(size(atlas_aal3));
    for i = 1:number_roi
        temp_roi_label = region_id(i);
        temp_roi_zscore = zscores(i,k);
        data(atlas_aal3==temp_roi_label) = temp_roi_zscore;
    end
    output_nifit_name = ['subtype0_stage',num2str(k-1),'.nii'];
    header.dt = [16,0];
    y_Write(data,header,output_nifit_name);
end

%**************************************
inputfile = importdata(['inputdata',filesep,'inputdata_Unmed_subtype1.csv']);
region_id = inputfile.data(:,1);
zscores = inputfile.data(:,2:end);
[number_roi, number_stage] = size(zscores);
for k = 1:number_stage
    data = zeros(size(atlas_aal3));
    for i = 1:number_roi
        temp_roi_label = region_id(i);
        temp_roi_zscore = zscores(i,k);
        data(atlas_aal3==temp_roi_label) = temp_roi_zscore;
    end
    output_nifit_name = ['subtype1_stage',num2str(k-1),'.nii'];
    header.dt = [16,0];
    y_Write(data,header,output_nifit_name);
end

%% plot brain mapping figure by BrainNet Viewer
plot_figure = 1;

if plot_figure == 1
    % cerebral
    for i = 0:16
        Surface_file = 'BrainMesh_ICBM152_smoothed.nv';
        Volume_file = ['subtype0_stage',num2str(i),'.nii'];
        Option_file = 'Cfg.mat';
        Output_file = ['f_subtype0_stage',num2str(i),'.jpg'];
        BrainNet_MapCfg(Surface_file,Volume_file,Option_file,Output_file);
    end
    for i = 0:16
        Surface_file = 'BrainMesh_ICBM152_smoothed.nv';
        Volume_file = ['subtype1_stage',num2str(i),'.nii'];
        Option_file = 'Cfg.mat';
        Output_file = ['f_subtype1_stage',num2str(i),'.jpg'];
        BrainNet_MapCfg(Surface_file,Volume_file,Option_file,Output_file);
    end    
    
    % cerebellum
    for i = 0:16
        Surface_file = 'BrainMesh_Cerebellum_by_SLF.nv';
        Volume_file = ['subtype0_stage',num2str(i),'.nii'];
        Option_file = 'Cfg_cerebellum.mat';
        Output_file = ['cb_subtype0_stage',num2str(i),'.jpg'];
        BrainNet_MapCfg(Surface_file,Volume_file,Option_file,Output_file);
    end
    for i = 0:16
        Surface_file = 'BrainMesh_Cerebellum_by_SLF.nv';
        Volume_file = ['subtype1_stage',num2str(i),'.nii'];
        Option_file = 'Cfg_cerebellum.mat';
        Output_file = ['cb_subtype1_stage',num2str(i),'.jpg'];
        BrainNet_MapCfg(Surface_file,Volume_file,Option_file,Output_file);
    end   
end


