function Create_Figures(obj)
% creates the two figures used in TransitionGUI
%
% This function is a member function of the class TransitionGUIClass

obj.fh(1) = figure();

% plot all initial and final points
for i=1:obj.Transition.n
    obj.ph_initial(i) = TransitionGUIClass.plot3_NED(obj.Transition.initial_ned(i,:),obj.marker_initial); hold on;
    obj.ph_final(i)   = TransitionGUIClass.plot3_NED(obj.Transition.final_ned(i,:)  ,obj.marker_final);
end

TransitionGUIClass.label_NED();