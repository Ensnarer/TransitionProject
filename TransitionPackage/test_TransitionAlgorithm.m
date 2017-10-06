% test_TransitionAlgorithm


addpath('transition test data');
load SU_to_SUlogo_data
% from singularity28 show

initial_ned = SU_final_global_ned;
final_ned = SUlogoext_global_ned;

Transition = TransitionClass(initial_ned,final_ned);