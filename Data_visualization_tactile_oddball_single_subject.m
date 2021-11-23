%Code : Anne-Lise Marais
%Preprocessing : Anne-Lise Marais or Marie Anquetil or Victoria Dumont w/ Netstation EGI
%Data acquisition : Marie Anquetil or Anne-Lise Marais or Victoria Dumont
%Protocol : Anne-Lise Marais

%This code plots single subject data on an oddball somatosensory protocol for the DECODE research. See https://www.unicaen.fr/projet_de_recherche/decode/
%7 conditions are plotted : Std (Standard, all standards stimulations except Seq1 and Seq10), Seq1 (40 first standards stimulations), Seq10 (40 last standards stimulations), StimMoy (Standard stimulation used for comparison), Deviant, PostOm (Standard stimulation right after the omission), Omission (Absence of stimulation)
%Omission last 7200 ms. A stimulation is expected after 3300-3700 ms. From 3700ms its an omission, the the X value is 0 ms into omission
%3 brain regions : ctrl (somatosensory), frtl (frontal), prtl (parietal)
%Variables in the workspace are segments from the EEG data
%Time window for the somatosensory responses P100 [150:200], N140 [200:400], P200 [250:500]
%%
load 'subjcode_Segment.mat'
%%
% A AMELIORER

%Merge epochs into a 3D matrix (x = electrodes, y = data, z = segments) using cat
Std_3D_subjcode=cat(3, Std_Segment_001, Std_Segment_002, Std_Segment_003, Std_Segment_004, Std_Segment_005, Std_Segment_006, Std_Segment_007, Std_Segment_008, Std_Segment_009, Std_Segment_010, Std_Segment_011, Std_Segment_012, Std_Segment_013, Std_Segment_014, Std_Segment_015, Std_Segment_016, Std_Segment_017, Std_Segment_018, Std_Segment_019, Std_Segment_020, Std_Segment_021, Std_Segment_022, Std_Segment_023, Std_Segment_024, Std_Segment_025, Std_Segment_026, Std_Segment_027, Std_Segment_028, Std_Segment_029, Std_Segment_030, Std_Segment_031, Std_Segment_032, Std_Segment_033, Std_Segment_034, Std_Segment_035, Std_Segment_036, Std_Segment_037, Std_Segment_038, Std_Segment_039, Std_Segment_040, Std_Segment_041, Std_Segment_042, Std_Segment_043, Std_Segment_044, Std_Segment_045, Std_Segment_046, Std_Segment_047, Std_Segment_048, Std_Segment_049, Std_Segment_050, Std_Segment_051, Std_Segment_052, Std_Segment_053, Std_Segment_054, Std_Segment_055, Std_Segment_056, Std_Segment_057, Std_Segment_058, Std_Segment_059, Std_Segment_060, Std_Segment_061, Std_Segment_062, Std_Segment_063, Std_Segment_064, Std_Segment_065, Std_Segment_066, Std_Segment_067, Std_Segment_068, Std_Segment_069, Std_Segment_070, Std_Segment_071, Std_Segment_072, Std_Segment_073, Std_Segment_074, Std_Segment_075, Std_Segment_076, Std_Segment_077, Std_Segment_078, Std_Segment_079, Std_Segment_080, Std_Segment_081, Std_Segment_082, Std_Segment_083, Std_Segment_084, Std_Segment_085, Std_Segment_086, Std_Segment_087, Std_Segment_088, Std_Segment_089, Std_Segment_090);
Seq1_3D_subjcode=cat(3, Seq1_Segment_001, Seq1_Segment_002, Seq1_Segment_003, Seq1_Segment_004, Seq1_Segment_005, Seq1_Segment_006, Seq1_Segment_007, Seq1_Segment_008, Seq1_Segment_009, Seq1_Segment_010, Seq1_Segment_011, Seq1_Segment_012, Seq1_Segment_013, Seq1_Segment_014, Seq1_Segment_015, Seq1_Segment_016, Seq1_Segment_017, Seq1_Segment_018, Seq1_Segment_019, Seq1_Segment_020, Seq1_Segment_021, Seq1_Segment_022, Seq1_Segment_023, Seq1_Segment_024, Seq1_Segment_025, Seq1_Segment_026, Seq1_Segment_027, Seq1_Segment_028, Seq1_Segment_029, Seq1_Segment_030, Seq1_Segment_031, Seq1_Segment_032, Seq1_Segment_033, Seq1_Segment_034, Seq1_Segment_035, Seq1_Segment_036, Seq1_Segment_037, Seq1_Segment_038, Seq1_Segment_039, Seq1_Segment_040);
Seq10_3D_subjcode=cat(3, Seq10_Segment_001, Seq10_Segment_002, Seq10_Segment_003, Seq10_Segment_004, Seq10_Segment_005, Seq10_Segment_006, Seq10_Segment_007, Seq10_Segment_008, Seq10_Segment_009, Seq10_Segment_010, Seq10_Segment_011, Seq10_Segment_012, Seq10_Segment_013, Seq10_Segment_014, Seq10_Segment_015, Seq10_Segment_016, Seq10_Segment_017, Seq10_Segment_018, Seq10_Segment_019, Seq10_Segment_020, Seq10_Segment_021, Seq10_Segment_022, Seq10_Segment_023, Seq10_Segment_024, Seq10_Segment_025, Seq10_Segment_026, Seq10_Segment_027, Seq10_Segment_028, Seq10_Segment_029, Seq10_Segment_030, Seq10_Segment_031, Seq10_Segment_032, Seq10_Segment_033, Seq10_Segment_034, Seq10_Segment_035, Seq10_Segment_036, Seq10_Segment_037, Seq10_Segment_038, Seq10_Segment_039, Seq10_Segment_040);
StimMoy_3D_subjcode=cat(3, StimMoy_Segment_001, StimMoy_Segment_002, StimMoy_Segment_003, StimMoy_Segment_004, StimMoy_Segment_005, StimMoy_Segment_006, StimMoy_Segment_007, StimMoy_Segment_008, StimMoy_Segment_009, StimMoy_Segment_010, StimMoy_Segment_011, StimMoy_Segment_012, StimMoy_Segment_013, StimMoy_Segment_014, StimMoy_Segment_015, StimMoy_Segment_016, StimMoy_Segment_017, StimMoy_Segment_018, StimMoy_Segment_019, StimMoy_Segment_020, StimMoy_Segment_021, StimMoy_Segment_022, StimMoy_Segment_023, StimMoy_Segment_024, StimMoy_Segment_025, StimMoy_Segment_026, StimMoy_Segment_027, StimMoy_Segment_028, StimMoy_Segment_029, StimMoy_Segment_030);
Deviant_3D_subjcode=cat(3, Deviant_Segment_001, Deviant_Segment_002, Deviant_Segment_003, Deviant_Segment_004, Deviant_Segment_005, Deviant_Segment_006, Deviant_Segment_007, Deviant_Segment_008, Deviant_Segment_009, Deviant_Segment_010, Deviant_Segment_011, Deviant_Segment_012, Deviant_Segment_013, Deviant_Segment_014, Deviant_Segment_015, Deviant_Segment_016, Deviant_Segment_017, Deviant_Segment_018, Deviant_Segment_019, Deviant_Segment_020, Deviant_Segment_021, Deviant_Segment_022, Deviant_Segment_023, Deviant_Segment_024, Deviant_Segment_025, Deviant_Segment_026, Deviant_Segment_027, Deviant_Segment_028, Deviant_Segment_029, Deviant_Segment_030);
PostOm_3D_subjcode=cat(3, PostOm_Segment_001, PostOm_Segment_002, PostOm_Segment_003, PostOm_Segment_004, PostOm_Segment_005, PostOm_Segment_006, PostOm_Segment_007, PostOm_Segment_008, PostOm_Segment_009, PostOm_Segment_010, PostOm_Segment_011, PostOm_Segment_012, PostOm_Segment_013, PostOm_Segment_014, PostOm_Segment_015, PostOm_Segment_016, PostOm_Segment_017, PostOm_Segment_018, PostOm_Segment_019, PostOm_Segment_020, PostOm_Segment_021, PostOm_Segment_022, PostOm_Segment_023, PostOm_Segment_024, PostOm_Segment_025, PostOm_Segment_026, PostOm_Segment_027, PostOm_Segment_028, PostOm_Segment_029, PostOm_Segment_030);
Omission_3D_subjcode=cat(3, Omission_Segment_001, Omission_Segment_002, Omission_Segment_003, Omission_Segment_004, Omission_Segment_005, Omission_Segment_006, Omission_Segment_007, Omission_Segment_008, Omission_Segment_009, Omission_Segment_010, Omission_Segment_011, Omission_Segment_012, Omission_Segment_013, Omission_Segment_014, Omission_Segment_015, Omission_Segment_016, Omission_Segment_017, Omission_Segment_018, Omission_Segment_019, Omission_Segment_020, Omission_Segment_021, Omission_Segment_022, Omission_Segment_023, Omission_Segment_024, Omission_Segment_025, Omission_Segment_026, Omission_Segment_027, Omission_Segment_028, Omission_Segment_029, Omission_Segment_030);
%Save and clean workspace
save ('3D_data_subjcode.mat','Std_3D_subjcode','Seq1_3D_subjcode','Seq10_3D_subjcode','StimMoy_3D_subjcode','Deviant_3D_subjcode','PostOm_3D_subjcode','Omission_3D_subjcode')
clear
load '3D_data_subjcode.mat'
%%
%Electrodes choice = Region of interest (ROI)
%Somatosensory electrodes = 28, 29, 35, 36, 41, 42, 47 (around C3)
%Frontal electrodes = 5, 6, 7, 12, 13, 106, 112 (between Fz and Cz)
%%
%Mean epochs to get Grand average per subject per condition per ROI
Std_subjcode=mean(Std_3D_subjcode,3);
Std_ctrl_subjcode=mean(Std_subjcode([28, 29, 35, 36, 41, 42, 47],:));
Std_frtl_subjcode=mean(Std_subjcode([5, 6, 7, 12, 13, 106, 112],:));
Seq1_subjcode=mean(Seq1_3D_subjcode,3);
Seq1_ctrl_subjcode=mean(Seq1_subjcode([28, 29, 35, 36, 41, 42, 47],:));
Seq1_frtl_subjcode=mean(Seq1_subjcode([5, 6, 7, 12, 13, 106, 112],:));
Seq10_subjcode=mean(Seq10_3D_subjcode,3);
Seq10_ctrl_subjcode=mean(Seq10_subjcode([28, 29, 35, 36, 41, 42, 47],:));
Seq10_frtl_subjcode=mean(Seq10_subjcode([5, 6, 7, 12, 13, 106, 112],:));
StimMoy_subjcode=mean(StimMoy_3D_subjcode,3);
StimMoy_ctrl_subjcode=mean(StimMoy_subjcode([28, 29, 35, 36, 41, 42, 47],:));
StimMoy_frtl_subjcode=mean(StimMoy_subjcode([5, 6, 7, 12, 13, 106, 112],:));
Deviant_subjcode=mean(Deviant_3D_subjcode,3);
Deviant_ctrl_subjcode=mean(Deviant_subjcode([28, 29, 35, 36, 41, 42, 47],:));
Deviant_frtl_subjcode=mean(Deviant_subjcode([5, 6, 7, 12, 13, 106, 112],:));
PostOm_subjcode=mean(PostOm_3D_subjcode,3);
PostOm_ctrl_subjcode=mean(PostOm_subjcode([28, 29, 35, 36, 41, 42, 47],:));
PostOm_frtl_subjcode=mean(PostOm_subjcode([5, 6, 7, 12, 13, 106, 112],:));
Omission_subjcode=mean(Omission_3D_subjcode,3);
Omission_ctrl_subjcode=mean(Omission_subjcode([28, 29, 35, 36, 41, 42, 47],:));
Omission_frtl_subjcode=mean(Omission_subjcode([5, 6, 7, 12, 13, 106, 112],:));
%%
%%Calculate mismatches
%Calculate Repetition suppression and plot it
RepetitionSuppression_subjcode = Seq10_subjcode - Seq1_subjcode;
RepetitionSuppression_ctrl_subjcode = Seq10_ctrl_subjcode - Seq1_ctrl_subjcode;
RepetitionSuppression_frtl_subjcode = Seq10_frtl_subjcode - Seq1_frtl_subjcode;
%Calculate Deviant mismatch and plot it
Deviant_mismatch_subjcode = StimMoy_subjcode - Deviant_subjcode;
Deviant_mismatch_ctrl_subjcode = StimMoy_ctrl_subjcode - Deviant_ctrl_subjcode;
Deviant_mismatch_frtl_subjcode = StimMoy_frtl_subjcode - Deviant_frtl_subjcode;
%Calculate PostOm mismatch and plot it
PostOm_mismatch_subjcode = StimMoy_subjcode - PostOm_subjcode;
PostOm_mismatch_ctrl_subjcode = StimMoy_ctrl_subjcode - PostOm_ctrl_subjcode;
PostOm_mismatch_frtl_subjcode = StimMoy_frtl_subjcode - PostOm_frtl_subjcode;
%%
save 'subjcode_Visualization'
%%
%Plot grand average per subject per condition
%%
%%Std
plot(Std_ctrl_subjcode, 'k')
set(gca,'YDir','reverse')
ylim([-6,6])
yticks([-11 -6 -5 -4 -3 -2 -1 0 1 2 3 4 5 6])
ylabel('µV')
xlim([0,1000])
xticks([0 100 120 150 180 200 240 300 400 500 600 700 800 900 1000])
xticklabels({'-100','0','20', '50', '80','100', '140','200','300', '400','500','600','700', '800', '900'})
xlabel('ms')
xtickangle(90)
grid on
title 'Std central subjcode'
plot(Std_frtl_subjcode, 'k')
set(gca,'YDir','reverse')
ylim([-6,6])
yticks([-11 -6 -5 -4 -3 -2 -1 0 1 2 3 4 5 6])
ylabel('µV')
xlim([0,1000])
xticks([0 100 120 150 180 200 240 300 400 500 600 700 800 900 1000])
xticklabels({'-100','0','20', '50', '80','100', '140','200','300', '400','500','600','700', '800', '900'})
xlabel('ms')
xtickangle(90)
grid on
title 'Std frontal subjcode'
%%
%%Seq1
plot(Seq1_ctrl_subjcode, 'Color',[0.4660 0.6740 0.1880])
set(gca,'YDir','reverse')
ylim([-6,6])
yticks([-11 -6 -5 -4 -3 -2 -1 0 1 2 3 4 5 6])
ylabel('µV')
xlim([0,1000])
xticks([0 100 120 150 180 200 240 300 400 500 600 700 800 900 1000])
xticklabels({'-100','0','20', '50', '80','100', '140','200','300', '400','500','600','700', '800', '900'})
xlabel('ms')
xtickangle(90)
grid on
title 'Seq1 central subjcode'
plot(Seq1_frtl_subjcode, 'Color',[0.4660 0.6740 0.1880])
set(gca,'YDir','reverse')
ylim([-6,6])
yticks([-11 -6 -5 -4 -3 -2 -1 0 1 2 3 4 5 6])
ylabel('µV')
xlim([0,1000])
xticks([0 100 120 150 180 200 240 300 400 500 600 700 800 900 1000])
xticklabels({'-100','0','20', '50', '80','100', '140','200','300', '400','500','600','700', '800', '900'})
xlabel('ms')
xtickangle(90)
grid on
title 'Seq1 frontal subjcode'
%%
%%Seq10
plot(Seq10_ctrl_subjcode,'Color',[0.4940 0.1840 0.5560])
set(gca,'YDir','reverse')
ylim([-6,6])
yticks([-11 -6 -5 -4 -3 -2 -1 0 1 2 3 4 5 6])
ylabel('µV')
xlim([0,1000])
xticks([0 100 120 150 180 200 240 300 400 500 600 700 800 900 1000])
xticklabels({'-100','0','20', '50', '80','100', '140','200','300', '400','500','600','700', '800', '900'})
xlabel('ms')
xtickangle(90)
grid on
title 'Seq10 central subjcode'
plot(Seq10_frtl_subjcode, 'Color',[0.4940 0.1840 0.5560])
set(gca,'YDir','reverse')
ylim([-6,6])
yticks([-11 -6 -5 -4 -3 -2 -1 0 1 2 3 4 5 6])
ylabel('µV')
xlim([0,1000])
xticks([0 100 120 150 180 200 240 300 400 500 600 700 800 900 1000])
xticklabels({'-100','0','20', '50', '80','100', '140','200','300', '400','500','600','700', '800', '900'})
xlabel('ms')
xtickangle(90)
grid on
title 'Seq10 frontal subjcode'
%%
%%StimMoy
plot(StimMoy_ctrl_subjcode, 'k')
set(gca,'YDir','reverse')
ylim([-6,6])
yticks([-11 -6 -5 -4 -3 -2 -1 0 1 2 3 4 5 6])
ylabel('µV')
xlim([0,1000])
xticks([0 100 120 150 180 200 240 300 400 500 600 700 800 900 1000])
xticklabels({'-100','0','20', '50', '80','100', '140','200','300', '400','500','600','700', '800', '900'})
xlabel('ms')
xtickangle(90)
grid on
title 'StimMoy central subjcode'
plot(StimMoy_frtl_subjcode, 'k')
set(gca,'YDir','reverse')
ylim([-6,6])
yticks([-11 -6 -5 -4 -3 -2 -1 0 1 2 3 4 5 6])
ylabel('µV')
xlim([0,1000])
xticks([0 100 120 150 180 200 240 300 400 500 600 700 800 900 1000])
xticklabels({'-100','0','20', '50', '80','100', '140','200','300', '400','500','600','700', '800', '900'})
xlabel('ms')
xtickangle(90)
grid on
title 'StimMoy frontal subjcode'
%%
%%Deviant
plot(Deviant_ctrl_subjcode, 'b')
set(gca,'YDir','reverse')
ylim([-6,6])
yticks([-11 -6 -5 -4 -3 -2 -1 0 1 2 3 4 5 6])
ylabel('µV')
xlim([0,1000])
xticks([0 100 120 150 180 200 240 300 400 500 600 700 800 900 1000])
xticklabels({'-100','0','20', '50', '80','100', '140','200','300', '400','500','600','700', '800', '900'})
xlabel('ms')
xtickangle(90)
grid on
title 'Deviant central subjcode'
plot(Deviant_frtl_subjcode, 'b')
set(gca,'YDir','reverse')
ylim([-6,6])
yticks([-11 -6 -5 -4 -3 -2 -1 0 1 2 3 4 5 6])
ylabel('µV')
xlim([0,1000])
xticks([0 100 120 150 180 200 240 300 400 500 600 700 800 900 1000])
xticklabels({'-100','0','20', '50', '80','100', '140','200','300', '400','500','600','700', '800', '900'})
xlabel('ms')
xtickangle(90)
grid on
title 'Deviant frontal subjcode'
%%
%%PostOm
plot(PostOm_ctrl_subjcode, 'Color',[0.8500, 0.3250, 0.0980])
set(gca,'YDir','reverse')
ylim([-6,6])
yticks([-11 -6 -5 -4 -3 -2 -1 0 1 2 3 4 5 6])
ylabel('µV')
xlim([0,1000])
xticks([0 100 120 150 180 200 240 300 400 500 600 700 800 900 1000])
xticklabels({'-100','0','20', '50', '80','100', '140','200','300', '400','500','600','700', '800', '900'})
xlabel('ms')
xtickangle(90)
grid on
title 'PostOm central subjcode'
plot(PostOm_frtl_subjcode, 'Color',[0.8500, 0.3250, 0.0980])
set(gca,'YDir','reverse')
ylim([-6,6])
yticks([-11 -6 -5 -4 -3 -2 -1 0 1 2 3 4 5 6])
ylabel('µV')
xlim([0,1000])
xticks([0 100 120 150 180 200 240 300 400 500 600 700 800 900 1000])
xticklabels({'-100','0','20', '50', '80','100', '140','200','300', '400','500','600','700', '800', '900'})
xlabel('ms')
xtickangle(90)
grid on
title 'PostOm frontal subjcode'
%%
%%Omission
%0ms corresponds to 0ms into the omission, before that, 
%a stimulation is expected between -400 to 0, corresponding to the jittered intervals
plot(Omission_ctrl_subjcode, 'r')
set(gca,'YDir','reverse')
ylim([-10,10])
yticks([-3 -2 -1 0 1 2 3])
xlim([0,7000])
xticks([0 3300 3700 7000])
xticklabels({'- 3700' '-400' '0' '3300'})
xtickangle(90)
grid on
title 'Omission en central subjcode'
plot(Omission_frtl_subjcode, 'r')
set(gca,'YDir','reverse')
ylim([-10,10])
yticks([-3 -2 -1 0 1 2 3])
xlim([0,7000])
xticks([0 3300 3700 7000])
xticklabels({'- 3700' '-400' '0' '3300'})
xtickangle(90)
grid on
title 'Omission en frontal subjcode'
%%
%Repetition Suppression
%Is Seq10 minus Seq1
plot(Seq1_ctrl_subjcode, 'Color',[0.4660 0.6740 0.1880])
hold on
plot (Seq10_ctrl_subjcode, 'Color',[0.4940 0.1840 0.5560])
hold off
set(gca,'YDir','reverse')
ylim([-6,6])
yticks([-11 -6 -5 -4 -3 -2 -1 0 1 2 3 4 5 6])
ylabel('µV')
xlim([0,1000])
xticks([0 100 120 150 180 200 240 300 400 500 600 700 800 900 1000])
xticklabels({'-100','0','20', '50', '80','100', '140','200','300', '400','500','600','700', '800', '900'})
xlabel('ms')
xtickangle(90)
grid on
title 'Repetition suppression central subjcode'
plot(Seq1_frtl_subjcode, 'Color',[0.4660 0.6740 0.1880])
hold on
plot (Seq10_frtl_subjcode, 'Color',[0.4940 0.1840 0.5560])
hold off
set(gca,'YDir','reverse')
ylim([-6,6])
yticks([-11 -6 -5 -4 -3 -2 -1 0 1 2 3 4 5 6])
ylabel('µV')
xlim([0,1000])
xticks([0 100 120 150 180 200 240 300 400 500 600 700 800 900 1000])
xticklabels({'-100','0','20', '50', '80','100', '140','200','300', '400','500','600','700', '800', '900'})
xlabel('ms')
xtickangle(90)
grid on
title 'Repetition suppression frontal subjcode'
legend 'Seq1' 'Seq10'
%Plot RS
plot(RepetitionSuppression_ctrl_subjcode)
set(gca,'YDir','reverse')
ylim([-10,6])
yticks([-10 -6 -5 -4 -3 -2 -1 0 1 2 3 4 5 6])
ylabel('µV')
set(gca,'YDir','reverse')
ylim([-6,6])
yticks([-11 -6 -5 -4 -3 -2 -1 0 1 2 3 4 5 6])
ylabel('µV')
xlim([0,1000])
xticks([0 100 120 150 180 200 240 300 400 500 600 700 800 900 1000])
xticklabels({'-100','0','20', '50', '80','100', '140','200','300', '400','500','600','700', '800', '900'})
xlabel('ms')
xtickangle(90)
grid on
title 'RS central subjcode'
plot(RepetitionSuppression_frtl_subjcode)
set(gca,'YDir','reverse')
ylim([-6,6])
yticks([-11 -6 -5 -4 -3 -2 -1 0 1 2 3 4 5 6])
ylabel('µV')
xlim([0,1000])
xticks([0 100 120 150 180 200 240 300 400 500 600 700 800 900 1000])
xticklabels({'-100','0','20', '50', '80','100', '140','200','300', '400','500','600','700', '800', '900'})
xlabel('ms')
xtickangle(90)
grid on
title 'RS frontal subjcode'
%%
%Deviant mismatch
%Is StimMoy minus Deviant
plot(StimMoy_ctrl_subjcode, 'k')
hold on
plot (Deviant_ctrl_subjcode, 'b')
hold off
set(gca,'YDir','reverse')
ylim([-6,6])
yticks([-11 -6 -5 -4 -3 -2 -1 0 1 2 3 4 5 6])
ylabel('µV')
xlim([0,1000])
xticks([0 100 120 150 180 200 240 300 400 500 600 700 800 900 1000])
xticklabels({'-100','0','20', '50', '80','100', '140','200','300', '400','500','600','700', '800', '900'})
xlabel('ms')
xtickangle(90)
grid on
title 'Deviant mismatch central subjcode'
legend 'StimMoy' 'Deviant'
plot(StimMoy_frtl_subjcode, 'k')
hold on
plot (Deviant_frtl_subjcode, 'b')
hold off
set(gca,'YDir','reverse')
ylim([-6,6])
yticks([-11 -6 -5 -4 -3 -2 -1 0 1 2 3 4 5 6])
ylabel('µV')
xlim([0,1000])
xticks([0 100 120 150 180 200 240 300 400 500 600 700 800 900 1000])
xticklabels({'-100','0','20', '50', '80','100', '140','200','300', '400','500','600','700', '800', '900'})
xlabel('ms')
xtickangle(90)
grid on
title 'Repetition suppression frontal subjcode'
legend 'StimMoy' 'Deviant'
%Plot Deviant mismatch
plot(Deviant_mismatch_ctrl_subjcode, 'b')
set(gca,'YDir','reverse')
ylim([-6,6])
yticks([-11 -6 -5 -4 -3 -2 -1 0 1 2 3 4 5 6])
ylabel('µV')
xlim([0,1000])
xticks([0 100 120 150 180 200 240 300 400 500 600 700 800 900 1000])
xticklabels({'-100','0','20', '50', '80','100', '140','200','300', '400','500','600','700', '800', '900'})
xlabel('ms')
xtickangle(90)
grid on
title 'Deviant mismatch central subjcode'
plot(Deviant_mismatch_frtl_subjcode, 'b')
set(gca,'YDir','reverse')
ylim([-6,6])
yticks([-11 -6 -5 -4 -3 -2 -1 0 1 2 3 4 5 6])
ylabel('µV')
xlim([0,1000])
xticks([0 100 120 150 180 200 240 300 400 500 600 700 800 900 1000])
xticklabels({'-100','0','20', '50', '80','100', '140','200','300', '400','500','600','700', '800', '900'})
xlabel('ms')
xtickangle(90)
grid on
title 'Deviant mismatch frontal subjcode'
%%
%PostOm mismatch
%Is StimMoy minus PostOm
plot(StimMoy_ctrl_subjcode, 'k')
hold on
plot (PostOm_ctrl_subjcode, 'Color',[0.8500, 0.3250, 0.0980])
hold off
set(gca,'YDir','reverse')
ylim([-6,6])
yticks([-11 -6 -5 -4 -3 -2 -1 0 1 2 3 4 5 6])
ylabel('µV')
xlim([0,1000])
xticks([0 100 120 150 180 200 240 300 400 500 600 700 800 900 1000])
xticklabels({'-100','0','20', '50', '80','100', '140','200','300', '400','500','600','700', '800', '900'})
xlabel('ms')
xtickangle(90)
grid on
title 'PostOm mismatch central subjcode'
legend 'StimMoy' 'PostOm'
plot(StimMoy_frtl_subjcode, 'k')
hold on
plot (PostOm_frtl_subjcode, 'Color',[0.8500, 0.3250, 0.0980])
hold off
set(gca,'YDir','reverse')
ylim([-6,6])
yticks([-11 -6 -5 -4 -3 -2 -1 0 1 2 3 4 5 6])
ylabel('µV')
xlim([0,1000])
xticks([0 100 120 150 180 200 240 300 400 500 600 700 800 900 1000])
xticklabels({'-100','0','20', '50', '80','100', '140','200','300', '400','500','600','700', '800', '900'})
xlabel('ms')
xtickangle(90)
grid on
title 'Repetition suppression frontal subjcode'
legend 'StimMoy' 'PostOm'
%Plot PostOm mismatch
plot(PostOm_mismatch_ctrl_subjcode, 'Color',[0.8500, 0.3250, 0.0980])
set(gca,'YDir','reverse')
ylim([-6,6])
yticks([-11 -6 -5 -4 -3 -2 -1 0 1 2 3 4 5 6])
ylabel('µV')
xlim([0,1000])
xticks([0 100 120 150 180 200 240 300 400 500 600 700 800 900 1000])
xticklabels({'-100','0','20', '50', '80','100', '140','200','300', '400','500','600','700', '800', '900'})
xlabel('ms')
xtickangle(90)
grid on
title 'PostOm mismatch central subjcode'
plot(PostOm_mismatch_frtl_subjcode, 'Color',[0.8500, 0.3250, 0.0980])
set(gca,'YDir','reverse')
ylim([-6,6])
yticks([-11 -6 -5 -4 -3 -2 -1 0 1 2 3 4 5 6])
ylabel('µV')
xlim([0,1000])
xticks([0 100 120 150 180 200 240 300 400 500 600 700 800 900 1000])
xticklabels({'-100','0','20', '50', '80','100', '140','200','300', '400','500','600','700', '800', '900'})
xlabel('ms')
xtickangle(90)
grid on
title 'PostOm mismatch frontal subjcode'