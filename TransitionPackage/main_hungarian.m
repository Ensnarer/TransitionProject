% main test script for Hungarian algorithm

addpath('Performances');
addpath(genpath('Design_Tools'));
addpath('Simulation');
addpath('Generation');
addpath('Hungarian');

% specify rng seed
rng(1,'twister');

%%

% setup_hungarian_test1
setup_hungarian_test2

numdrones=size(formation1_ned,1);

%% try unmodified hungarian assignments

hun_assignments=hungarian(formation1_ned,formation2_ned);

dt=0.05;
L=1;
plot_transition_jit(formation1_ned,formation2_ned,hun_assignments,dt,L);
title('hungarian, L=1');

dt=0.05;
L=0.8;
plot_transition_jit(formation1_ned,formation2_ned,hun_assignments,dt,L);
title('hungarian, L=0.8');
%% try romanian assignments

rom_assignments=romanian(formation1_ned,formation2_ned);

dt=0.05;
L=1;
plot_transition_jit(formation1_ned,formation2_ned,rom_assignments,dt,L);
title('romanian, L=1');

dt=0.05;
L=0.8;
plot_transition_jit(formation1_ned,formation2_ned,rom_assignments,dt,L);
title('romanian, L=0.8');
%% try manual assignments

% try
% assignments=manual_assignments;
% catch ME
%     fprintf('no manual assignments found.\n');
%     ME.message;
% end
% 
% dt=0.05;
% L=1;
% plot_transition_jit(formation1_ned,formation2_ned,assignments,dt,L);
% title('manual, L=1');
% 
% dt=0.05;
% L=sqrt(4.25);
% plot_transition_jit(formation1_ned,formation2_ned,assignments,dt,L);
% title('manual, L=2.06');
% 
% total_duration=plot_transition_asap(formation1_ned,formation2_ned,assignments,delays,dt,L);
% title('delayed asap transition');