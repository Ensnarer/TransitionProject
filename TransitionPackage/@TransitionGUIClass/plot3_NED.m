function ph = plot3_NED(ned,varargin)
% ned is a nx3 array.
% ph is the returned plot handle from the call to plot3()
%
% this function is a static method of the class TransitionGUIClass.

ph=plot3(ned(:,2),ned(:,1),-ned(:,3),varargin{:});
axis equal
end