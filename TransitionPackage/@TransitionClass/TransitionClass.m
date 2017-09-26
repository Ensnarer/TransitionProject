% class definition file for 'TransitionClass'
%
% note: TransitionClass is a subclass of 'handle' class. This makes all
% TransitionClass objects references: all modifications to handle objects
% affect the original object.

classdef TransitionClass < handle 
    
    properties
        Assignments % n-by-m integer array
        Names % length m cell array of strings
    end
    methods
        % constructor
        function obj=TransitionClass(n)
        end
    end
end