% computes both cost matrices: obj.C_duration and obj.C_distance.
%
% The (i,j) entry of obj.C_duration is the minimum duration
% required for a drone at initial_ned(i,:) to move to final_ned(j,:)
%
% The (i,j) entry of obj.C_distance is the distance
% between initial_ned(i,:) and final_ned(j,:)

function compute_cost_matrices(obj)

for i=1:obj.n
    for j=1:obj.n
        obj.C_duration(i,j) = compute_duration(obj,obj.initial_ned(i,:),obj.final_ned(i,:));
        obj.C_distance(i,j) = norm( obj.initial_ned(i,:) - obj.final_ned(i,:) );
    end
end

end

function t = compute_duration(obj,ned1,ned2)

horizontal_distance = norm(ned1(1:2)-ned2(1:2));
horizontal_duration = horizontal_distance/obj.max_horizontal_speed;

vertical_displacement = ned2(3) - ned1(3);
if vertical_displacement > 0
    vertical_duration = vertical_displacement/obj.max_vertical_velocity;
else
    vertical_duration = vertical_displacement/obj.min_vertical_velocity;
end

t = max(horizontal_duration,vertical_duration);

end