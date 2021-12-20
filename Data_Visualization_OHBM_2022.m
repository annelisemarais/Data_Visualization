%Code : Anne-Lise Marais
%Preprocessing : Anne-Lise Marais or Marie Anquetil or Victoria Dumont w/ Netstation EGI
%Data acquisition : Marie Anquetil or Anne-Lise Marais or Victoria Dumont
%Protocol : Anne-Lise Marais

%This code was written for abstract submission for Organization for Human
%Brain Mapping 2022. 
%This code plots the data of 4 subjects on an oddball somatosensory protocol for the DECODE research. See https://www.unicaen.fr/projet_de_recherche/decode/
%7 conditions are plotted : Std (Standard, all standards stimulations except Fam and Con), Fam (40 first standards stimulations), Con (40 last standards stimulations), StimMoy (Standard stimulation used for comparison), Deviant, PostOm (Standard stimulation right after the omission), Omission (Absence of stimulation)
%Omission last 7200 ms. A stimulation is expected after 3300-3700 ms. From 3700ms its an omission, the the X value is 0 ms into omission
%3 brain regions : ctrl (somatosensory), frtl (frontal), prtl (parietal)
%Variables in the workspace are segments from the EEG data
%Time window for the somatosensory responses P100 [150:200], N140 [200:400], P200 [250:500]
%%
%A AMELIORER

%load multiple mat file
load ...\Data_subject1.mat
load ...\Data_subject2.mat
load ...\Data_subject3.mat
load ...\Data_subject4.mat
%%
%Electrodes choice = Region of interest (ROI)
%Somatosensory electrodes = 28, 29, 35, 36, 41, 42, 47 (around C3)
%Frontal electrodes = 5, 6, 7, 12, 13, 106, 112 (between Fz and Cz)
%%
%Concatenate the data of every subject and extract the mean of the ROI
% Output : 1000 (data) * X segments per condition

Con_3D = cat(3, Con_3D_02_T_Tact, Con_3D_F_T_1, Con_3D_F_T_3, Con_3D_F_T_4);
Con_ctrl_2D=permute(mean(Con_3D([28, 29, 35, 36, 41, 42, 47],:,:)),[2 3 1]);
Con_frtl_2D=permute(mean(Con_3D([5, 6, 7, 12, 13, 106, 112],:,:)),[2 3 1]);
Fam_3D = cat(3, Fam_3D_02_T_Tact, Fam_3D_F_T_1, Fam_3D_F_T_3, Fam_3D_F_T_4);
Fam_ctrl_2D=permute(mean(Fam_3D([28, 29, 35, 36, 41, 42, 47],:,:)),[2 3 1]);
Fam_frtl_2D=permute(mean(Fam_3D([5, 6, 7, 12, 13, 106, 112],:,:)),[2 3 1]);
StimMoy_3D = cat(3, StimMoy_3D_02_T_Tact, StimMoy_3D_F_T_1, StimMoy_3D_F_T_3, StimMoy_3D_F_T_4);
StimMoy_ctrl_2D=permute(mean(StimMoy_3D([28, 29, 35, 36, 41, 42, 47],:,:)),[2 3 1]);
StimMoy_frtl_2D=permute(mean(StimMoy_3D([5, 6, 7, 12, 13, 106, 112],:,:)),[2 3 1]);
Std_3D = cat(3, Std_3D_02_T_Tact, Std_3D_F_T_1, Std_3D_F_T_3, Std_3D_F_T_4);
Std_ctrl_2D=permute(mean(Std_3D([28, 29, 35, 36, 41, 42, 47],:,:)),[2 3 1]);
Std_frtl_2D=permute(mean(Std_3D([5, 6, 7, 12, 13, 106, 112],:,:)),[2 3 1]);
Omission_3D = cat(3, Omission_3D_02_T_Tact, Omission_3D_F_T_1, Omission_3D_F_T_3, Omission_3D_F_T_4);
Omission_ctrl_2D=permute(mean(Omission_3D([28, 29, 35, 36, 41, 42, 47],:,:)),[2 3 1]);
Omission_frtl_2D=permute(mean(Omission_3D([5, 6, 7, 12, 13, 106, 112],:,:)),[2 3 1]);
PostOm_3D = cat(3, PostOm_3D_02_T_Tact, PostOm_3D_F_T_1, PostOm_3D_F_T_3, PostOm_3D_F_T_4);
PostOm_ctrl_2D=permute(mean(PostOm_3D([28, 29, 35, 36, 41, 42, 47],:,:)),[2 3 1]);
PostOm_frtl_2D=permute(mean(PostOm_3D([5, 6, 7, 12, 13, 106, 112],:,:)),[2 3 1]);
Deviant_3D = cat(3, Deviant_3D_02_T_Tact, Deviant_3D_F_T_1, Deviant_3D_F_T_3, Deviant_3D_F_T_4);
Deviant_ctrl_2D=permute(mean(Deviant_3D([28, 29, 35, 36, 41, 42, 47],:,:)),[2 3 1]);
Deviant_frtl_2D=permute(mean(Deviant_3D([5, 6, 7, 12, 13, 106, 112],:,:)),[2 3 1]);

%save
save 'OHBM_3D' Omission_3D Omission_ctrl_2D Omission_frtl_2D  PostOm_3D PostOm_ctrl_2D PostOm_frtl_2D Deviant_3D Deviant_ctrl_2D Deviant_frtl_2D StimMoy_3D StimMoy_ctrl_2D StimMoy_frtl_2D Con_3D Con_ctrl_2D Con_frtl_2D Fam_3D Fam_ctrl_2D Fam_frtl_2D Std_3D Std_ctrl_2D Std_frtl_2D
clear
load OHBM_3D
%%
%%Calculate mismatches
%Calculate Repetition suppression
RepetitionSuppression_ctrl = mean(Con_ctrl_2D,2) - mean(Fam_ctrl_2D,2);
RepetitionSuppression_frtl = mean(Con_frtl_2D,2) - mean(Fam_frtl_2D,2);

%Calculate Deviant mismatch
Deviant_mismatch_ctrl =  mean(Deviant_ctrl_2D,2) - mean(Std_ctrl_2D,2);
Deviant_mismatch_frtl = mean(Deviant_frtl_2D,2) - mean(Std_frtl_2D,2);

%Calculate PostOm mismatch
PostOm_mismatch_ctrl =  mean(PostOm_ctrl_2D,2) - mean(Std_ctrl_2D,2);
PostOm_mismatch_frtl =  mean(PostOm_frtl_2D,2) - mean(Std_frtl_2D,2);
%%
save OHBM_3D
%Then plot every condition
%Plot the mean electrical activation per condition
%Highlight where data could be significant
%%
%%Std
plot(mean(Std_ctrl_2D,2), 'k')
hold on
plot(mean(Std_frtl_2D,2), '--', 'Color', [0.5450 0.0392 0.3137])
hold off
set(gca,'YDir','reverse', 'box', 'off')
ylim([-7,5])
yticks([-7 -6 -5 -4 -3 -2 -1 0 1 2 3 4 5])
ylabel('Electrical activity (µV)')
xlim([0,1000])
xticks([0 100 200 240 300 400 500 600 700 800 900 1000])
xticklabels({'-100','0', '100', '140','200','300', '400','500','600','700', '800', '900'})
xlabel('Time (ms)')
xtickangle(45)
patch([150 230 230 150],[-9 -9 7 7],'black', 'EdgeColor','none', 'FaceAlpha', 0.1)
patch([240 320 320 240],[-9 -9 7 7],'black', 'EdgeColor','none', 'FaceAlpha', 0.1)
patch([330 480 480 330],[-9 -9 7 7],'black', 'EdgeColor','none', 'FaceAlpha', 0.1)
patch([100 300 300 100],[4.5 4.5 5 5],'blue', 'EdgeColor','none', 'FaceAlpha', 0.1)
text(155, 2, 'P100')
text(240, -6, 'N140')
text(600, -3.5, 'Late negative', 'Color', [0.5450 0.0392 0.3137])
text(600, -3, 'component', 'Color', [0.5450 0.0392 0.3137])
text(110, 4.7, 'Stimulation', 'Color', 'blue')
title 'Somatosensory and frontal standard response'
legend 'Somatosensory' 'Frontal' 'Location' 'Southeast'
%%
%%Omission
%0ms corresponds to 0ms into the omission, before that, 
%a stimulation is expected between -400 to 0, corresponding to the jittered intervals
plot(mean(Omission_ctrl_2D,2), 'Color', [0.6350, 0.0780, 0.1840])
hold on
plot(mean(Omission_frtl_2D,2), '--r')
hold off
set(gca,'YDir','reverse', 'box', 'off')
ylim([-5,5])
yticks([-3 -2 -1 0 1 2 3])
xlim([0,7000])
xticks([0 3300 3700 7000])
xticklabels({'- 3700' '-400' '0' '3300'})
patch([0 3300 3300 0],[9.5 9.5 10 10],'magenta', 'EdgeColor','none', 'FaceAlpha', 0.1)
patch([3700 7000 7000 3700],[9.5 9.5 10 10],'red', 'EdgeColor','none', 'FaceAlpha', 0.1)
text(700, 9.6, 'Expecting stimulation', 'Color', 'magenta')
text(4500, 9.6, 'Omission', 'Color', 'red')
xtickangle(45)
title 'Somatosensory and frontal omission '
legend 'Somatosensory' 'Frontal' 'Location' 'Southeast'
%%
%Repetition Suppression
%Is Con minus Fam
plot(mean(Fam_ctrl_2D,2), 'Color',[0.4660 0.6740 0.1880])
hold on
plot (mean(Con_ctrl_2D,2), 'Color',[0.4940 0.1840 0.5560])
hold off
set(gca,'YDir','reverse', 'box', 'off')
ylim([-7,5])
yticks([-7 -6 -5 -4 -3 -2 -1 0 1 2 3 4 5])
ylabel('Electrical activity (µV)')
xlim([0,1000])
xticks([0 100 200 240 300 400 500 600 700 800 900 1000])
xticklabels({'-100','0', '100', '140','200','300', '400','500','600','700', '800', '900'})
xlabel('Time (ms)')
xtickangle(45)
patch([240 320 320 240],[-9 -9 7 7],'black', 'EdgeColor','none', 'FaceAlpha', 0.1)
patch([100 300 300 100],[4.5 4.5 5 5],'blue', 'EdgeColor','none', 'FaceAlpha', 0.1)
text(240, -6.3, 'N140')
text(110, 4.7, 'Stimulation', 'Color', 'blue')
title 'Somatosensory repetition suppression'
legend('Familiarization ', 'Control ', 'Location', 'Northeast')
%%
%Deviant mismatch
%Is StimMoy minus Deviant
plot(mean(Std_ctrl_2D,2), 'k')
hold on
plot (mean(Deviant_ctrl_2D,2), 'b')
hold off
set(gca,'YDir','reverse', 'box', 'off')
ylim([-7,5])
yticks([-7 -6 -5 -4 -3 -2 -1 0 1 2 3 4 5])
ylabel('Electrical activity (µV)')
xlim([0,1000])
xticks([0 100 200 240 300 400 500 600 700 800 900 1000])
xticklabels({'-100','0', '100', '140','200','300', '400','500','600','700', '800', '900'})
xlabel('Time (ms)')
xtickangle(45)
patch([150 230 230 150],[-9 -9 7 7],'black', 'EdgeColor','none', 'FaceAlpha', 0.1)
patch([240 320 320 240],[-9 -9 7 7],'black', 'EdgeColor','none', 'FaceAlpha', 0.1)
patch([330 480 480 330],[-9 -9 7 7],'black', 'EdgeColor','none', 'FaceAlpha', 0.1)
patch([100 300 300 100],[4.5 4.5 5 5],'blue', 'EdgeColor','none', 'FaceAlpha', 0.1)
text(155, 3, 'P100')
text(240, -5, 'N140')
text(380, 3, 'P200')
text(110, 4.7, 'Stimulation', 'Color', 'blue')
title 'Somatosensry deviance'
legend('Standard', 'Deviant', 'Location', 'Southeast')
%%
plot(mean(Std_frtl_2D,2), 'k')
hold on
plot (mean(Deviant_frtl_2D,2), 'b')
hold off
set(gca,'YDir','reverse', 'box', 'off')
ylim([-7,5])
yticks([-7 -6 -5 -4 -3 -2 -1 0 1 2 3 4 5])
ylabel('Electrical activity (µV)')
xlim([0,1000])
xticks([0 100 200 240 300 400 500 600 700 800 900 1000])
xticklabels({'-100','0', '100', '140','200','300', '400','500','600','700', '800', '900'})
xlabel('Time (ms)')
xtickangle(45)
patch([100 300 300 100],[4.5 4.5 5 5],'blue', 'EdgeColor','none', 'FaceAlpha', 0.1)
patch([500 690 690 500],[-9 -9 7 7],'black', 'EdgeColor','none', 'FaceAlpha', 0.1)
text(510, 3.5, 'Late positive ')
text(510, 4, 'component')
text(110, 4.7, 'Stimulation', 'Color', 'blue')
title 'Frontal deviance'
legend 'Standard' 'Deviant'  'Location' 'Northwest'
%%
%Plot Deviant mismatch
plot(Deviant_mismatch_ctrl, 'r')
hold on
plot(Deviant_mismatch_frtl, 'b')
hold off
set(gca,'YDir','reverse', 'box', 'off')
ylim([-7,5])
yticks([-7 -6 -5 -4 -3 -2 -1 0 1 2 3 4 5])
ylabel('Electrical activity (µV)')
xlim([0,1000])
xticks([0 100 200 240 300 400 500 600 700 800 900 1000])
xticklabels({'-100','0', '100', '140','200','300', '400','500','600','700', '800', '900'})
xlabel('Time (ms)')
xline = [0 1000];
yline = [0 0];
line(xline,yline, 'Color', 'black')
xtickangle(45)
patch([500 700 700 500],[-7 -7 7 7],'black', 'EdgeColor','none', 'FaceAlpha', 0.1)
patch([100 300 300 100],[4.5 4.5 5 5],'blue', 'EdgeColor','none', 'FaceAlpha', 0.1)
text(110, 4.7, 'Stimulation', 'Color', 'blue')
text(510, 3, 'Late positive')
text(510, 3.5, 'components')
title 'Somatosensory and frontal deviance mismatch'
legend 'Somatosensory' 'Frontal' 'Location' 'Northeast'
%%
%PostOm mismatch
%Is StimMoy minus PostOm
plot(mean(Std_ctrl_2D,2), 'k')
hold on
plot (mean(PostOm_ctrl_2D,2), '--k')
plot(mean(Std_frtl_2D,2), 'Color',[0.8500, 0.3250, 0.0980])
plot (mean(PostOm_frtl_2D,2), '--', 'Color',[0.8500, 0.3250, 0.0980])
hold off
set(gca,'YDir','reverse', 'box', 'off')
ylim([-7,5])
yticks([-7 -6 -5 -4 -3 -2 -1 0 1 2 3 4 5])
ylabel('Electrical activity (µV)')
xlim([0,1000])
xticks([0 100 200 240 300 400 500 600 700 800 900 1000])
xticklabels({'-100','0', '100', '140','200','300', '400','500','600','700', '800', '900'})
xlabel('Time (ms)')
xtickangle(45)
patch([150 230 230 150],[-9 -9 7 7],'black', 'EdgeColor','none', 'FaceAlpha', 0.1)
patch([240 320 320 240],[-9 -9 7 7],'black', 'EdgeColor','none', 'FaceAlpha', 0.1)
patch([700 950 950 700],[-9 -9 7 7],'black', 'EdgeColor','none', 'FaceAlpha', 0.1)
patch([100 300 300 100],[4.5 4.5 5 5],'blue', 'EdgeColor','none', 'FaceAlpha', 0.1)
text(155, 2.5, 'P100')
text(110, 4.7, 'Stimulation', 'Color', 'blue')
title 'Somatosensory postOm Term vs Preterm'
legend('Smtsr standard', 'Smtsr postOm', 'Frontal standard', 'Frontal postOm', 'Location', 'Southeast')
%%
%Plot PostOm mismatch
plot(PostOm_mismatch_ctrl, 'r')
hold on
plot(PostOm_mismatch_frtl, 'b')
hold off
set(gca,'YDir','reverse', 'box', 'off')
ylim([-7,5])
yticks([-7 -6 -5 -4 -3 -2 -1 0 1 2 3 4 5])
ylabel('Electrical activity (µV)')
xlim([0,1000])
xticks([0 100 200 300 400 500 600 700 800 900 1000])
xticklabels({'-100','0', '100', '200','300', '400','500','600','700', '800', '900'})
xlabel('Time (ms)')
xtickangle(45)
line(xline,yline, 'Color', 'black')
patch([500 1000 1000 500],[-7 -7 7 7],'black', 'EdgeColor','none', 'FaceAlpha', 0.1)
patch([100 300 300 100],[4.5 4.5 5 5],'blue', 'EdgeColor','none', 'FaceAlpha', 0.1)
text(700, 2.5, 'Late positive', 'Color','blue')
text(700, 3, 'component', 'Color','blue')
text(700, -3.5, 'Late negative', 'Color', 'red')
text(700, -3, 'component', 'Color', 'red')
text(110, 4.7, 'Stimulation', 'Color', 'blue')
title 'Somatosensory and frontal postOm mismatch'
legend 'Somatosensory' 'Frontal' 'Location' 'Northwest'