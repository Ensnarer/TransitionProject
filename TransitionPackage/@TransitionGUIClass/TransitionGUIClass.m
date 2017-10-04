% class definition file for 'TransitionGUIClass'
%
% note: TransitionGUIClass is a subclass of 'handle' class. This makes all
% TransitionGUIClass objects references: all modifications to handle objects
% affect the original object.
%
% usage:
% TransitionGUI = TransitionGUIClass(...);
%   --> takes the same arguments as TransitionClass.
%   --> see help TransitionClass

classdef TransitionGUIClass < handle 
    
    properties
        Transition % object of TransitionClass
        
        fh % array of figure handles
    end
    methods
        % constructor
        function obj=TransitionGUIClass(varargin)
            
            % all arguments directly passed through
            obj.Transition = TransitionClass(varargin{:});
        end
    end
end