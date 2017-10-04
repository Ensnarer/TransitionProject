% class definition file for 'TransitionClass'
%
% note: TransitionClass is a subclass of 'handle' class. This makes all
% TransitionClass objects references: all modifications to handle objects
% affect the original object.
%
% usage:
% Transition1 = TransitionClass(initial_ned,final_ned,pairings);
% Transition2 = TransitionClass(initial_ned,final_ned);
% Transition3 = TransitionClass(Transition1);

classdef TransitionClass < handle 
    
    properties
        initial_ned
        final_ned
        pairings
        
        n
        intermediate_points % indices are in <initial_ned> indices
    end
    methods
        % constructor
        function obj=TransitionClass(initial_ned,final_ned,pairings)
            
            % copy constructor
            if nargin==1 && isa(initial_ned,'TransitionClass')
                % if first (and only) argument is an object of this class
                % (TransitionClass), then this constructor is being called
                % as a copy constructor.
                original_object = initial_ned;
                
                obj.initial_ned     = original_object.initial_ned;
                obj.final_ned       = original_object.final_ned;
                obj.pairings        = original_object.pairings;
                obj.n               = original_object.n;
                obj.intermediate_points     = original_object.intermediate_points;
                
                return;
            end
            
            
            
            % default arguments
            if nargin<3
                pairings=[];
            end
            
            % input checking
            if size(initial_ned,2)~=3 || size(final_ned,2)~=3
                error('"initial_ned" and "final_ned" must be nx3 arrays.\n');
            end
            if size(initial_ned,1)~=size(final_ned,1)
                error('"initial_ned" and "final_ned" must be arrays of identical size.\n');
            end
            
            % assignment
            obj.initial_ned = initial_ned;
            obj.final_ned = final_ned;
            obj.pairings = pairings;
            obj.n = size(initial_ned,1);
            obj.intermediate_points = [];
        end
    end
end