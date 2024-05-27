%% plot brain map figures

clear;clc
cd('/Users/jyc_mac/BaiduCloud/Project/enigma/figures/BrainSignatures')
load('data.mat')


%% plot z-score
%% cortical thickness
for i = 1:6  % plot z-score
map = CortThick(1:68,i)'; map = map.* (-1);
data = parcel_to_surface(map, 'aparc_fsa5');
% Project the results on the surface brain
f = figure(i)
plot_cortical(data, 'surface_name','fsa5','background','white','color_range',...
    [-0.4, 0.4], 'cmap', 'TealRd')   % TealRd; RdBu
figure_name = ['CortThick',num2str(i)];
print(f, figure_name, '-dpng', '-r300')
end

for i = 10:12 % plot Cohen's d
    map = CortThick(1:68,i)';
    data = parcel_to_surface(map, 'aparc_fsa5');
    f = figure(i);
    plot_cortical(data, 'surface_name','fsa5','background','white','color_range',...
    [0, 0.4], 'cmap', 'Blues');  % fake_parula
    figure_name = ['CortThick',num2str(i),'_pos'];
    print(f, figure_name, '-dpng', '-r300')
    
    f = figure(i);
    plot_cortical(data, 'surface_name','fsa5','background','white','color_range',...
    [-0.4, 0], 'cmap', 'Reds_r');
    figure_name = ['CortThick',num2str(i),'_neg'];   
    print(f, figure_name, '-dpng', '-r300')
end


%% cortical volume
for i = 1:6  % plot z-score
map = CortVolume(1:68,i)'; map = map.* (-1);
data = parcel_to_surface(map, 'aparc_fsa5');
% Project the results on the surface brain
f = figure(i)
plot_cortical(data, 'surface_name','fsa5','background','white','color_range',...
    [-0.4, 0.4], 'cmap', 'TealRd')   % TealRd; RdBu
figure_name = ['CortVolume',num2str(i)];
print(f, figure_name, '-dpng', '-r300')
end

for i = 10:12 % plot Cohen's d
    map = CortVolume(1:68,i)';
    data = parcel_to_surface(map, 'aparc_fsa5');
    f = figure(i);
    plot_cortical(data, 'surface_name','fsa5','background','white','color_range',...
    [0, 0.4], 'cmap', 'Blues');  % fake_parula
    figure_name = ['CortVolume',num2str(i),'_pos'];
    print(f, figure_name, '-dpng', '-r300')
    
    f = figure(i);
    plot_cortical(data, 'surface_name','fsa5','background','white','color_range',...
    [-0.4, 0], 'cmap', 'Reds_r');
    figure_name = ['CortVolume',num2str(i),'_neg'];   
    print(f, figure_name, '-dpng', '-r300')
end

%% cortical area
for i = 1:6  % plot z-score
map = CortArea(1:68,i)'; map = map.* (-1);
data = parcel_to_surface(map, 'aparc_fsa5');
% Project the results on the surface brain
f = figure(i)
plot_cortical(data, 'surface_name','fsa5','background','white','color_range',...
    [-0.4, 0.4], 'cmap', 'TealRd')   % TealRd; RdBu
figure_name = ['CortArea',num2str(i)];
print(f, figure_name, '-dpng', '-r300')
end

for i = 10:12 % plot Cohen's d
    map = CortArea(1:68,i)';
    data = parcel_to_surface(map, 'aparc_fsa5');
    f = figure(i);
    plot_cortical(data, 'surface_name','fsa5','background','white','color_range',...
    [0, 0.4], 'cmap', 'Blues');  % fake_parula
    figure_name = ['CortArea',num2str(i),'_pos'];
    print(f, figure_name, '-dpng', '-r300')
    
    f = figure(i);
    plot_cortical(data, 'surface_name','fsa5','background','white','color_range',...
    [-0.4, 0], 'cmap', 'Reds_r');
    figure_name = ['CortArea',num2str(i),'_neg'];   
    print(f, figure_name, '-dpng', '-r300')
end


%% subcortical volume
for i = 1:6  % plot z-score
map = SubVolume(1:16,i)'; map = map.* (-1);
data = map;
% Project the results on the surface brain
f = figure(i)
plot_subcortical(data, 'ventricles', 'True', 'color_range',...
    [-0.4, 0.4], 'cmap', 'TealRd')
figure_name = ['subcortical',num2str(i)];
print(f, figure_name, '-dpng', '-r300')
end

for i = 10:12 % plot Cohen's d
    map = SubVolume(1:16,i)';
    data = map;
    f = figure(i);
    plot_subcortical(data, 'ventricles', 'True','color_range',...
    [0, 0.4], 'cmap', 'Blues');  % fake_parula
    figure_name = ['subcortical',num2str(i),'_pos'];
    print(f, figure_name, '-dpng', '-r300')

    f = figure(i);
    plot_subcortical(data, 'ventricles', 'True','color_range',...
    [-0.4, 0], 'cmap', 'Reds_r');  % fake_parula
    figure_name = ['subcortical',num2str(i),'_neg'];
    print(f, figure_name, '-dpng', '-r300')    

end



%f = figure,
%    plot_subcortical(map1(1:14), 'ventricles', 'False', 'color_range', [0.4 0.6], 'cmap', 'RdBu_r')



% cmap: Blues_r, Blues, eco_kos, fake_parula, Greys, GyBu_r, GyBu, GyRd_r,
% GyRd, inferno, magma, plasma, RdBu_r, RdBu, Reds_r, Reds, romaO_r,romaO,
% TealRd, viridis