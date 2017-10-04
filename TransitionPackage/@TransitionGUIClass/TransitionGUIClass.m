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
        ph_initial % array of plot handles for initial points
        ph_final % array of plot handles for initial points
        ph % cell array of arrays of plot handles for intermediate points
    end
    
    properties (Constant)
        marker_initial = 'bo' % marker style for initial points
        marker_final = 'go' % marker style for final points
    end
    
    % constructor
    methods
        
        function obj=TransitionGUIClass(varargin)
            
            % all arguments directly passed through
            obj.Transition = TransitionClass(varargin{:});
            
            obj.Create_Figures();
        end
    end
        
    % class method function signatures
    methods
        
        Create_Figures(obj)
    end
    
    % static method function signatures
    methods (Static)
        
        ph = plot3_NED(ned,varargin)
        
        label_NED()
    end
    
end