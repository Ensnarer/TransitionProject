function total_duration=plot_transition_asap(formation1_ned,formation2_ned,assignments,delays,dt,L)



%%

figure;

n=size(formation1_ned,1);

path_durations=delays;
for i=1:n
    j=assignments(i);
    
    initial_ned=formation1_ned(i,:);
    final_ned=formation2_ned(j,:);
    path_durations(i) = get_path_duration(initial_ned,final_ned);
    
    [x,y,z]=get_xyz(...
        [formation1_ned(i,1) formation2_ned(j,1)],...
        [formation1_ned(i,2) formation2_ned(j,2)],...
        [formation1_ned(i,3) formation2_ned(j,3)]);
    plot3(x,y,z,'b'); hold on;
    
    
    [x1,y1,z1]=get_xyz(...
        [formation1_ned(i,1)],...
        [formation1_ned(i,2)],...
        [formation1_ned(i,3)]);
    plot3(x1,y1,z1,'bo'); hold on;
    
    [x2,y2,z2]=get_xyz(...
        [formation2_ned(i,1)],...
        [formation2_ned(i,2)],...
        [formation2_ned(i,3)]);
    plot3(x2,y2,z2,'go'); hold on;
end

total_durations = delays+path_durations;
total_duration = max(total_durations);

for t=0:dt:total_duration
    
    % get the positions of all the drones at this time
    ned=zeros(n,3);
    for i=1:n
        j=assignments(i);
        
        initial_ned=formation1_ned(i,:);
        final_ned=formation2_ned(j,:);
        
        ned(i,:) = vector_linear_interpolation(delays(i),total_durations(i),...
            initial_ned,final_ned,...
            t);
    end
    
    for i=1:n-1
        for j=i+1:n
            dist = norm( ned(i,:) - ned(j,:) );
            if dist<L
                [x,y,z]=get_xyz([ned(i,1) ned(j,1)],[ned(i,2) ned(j,2)],[ned(i,3) ned(j,3)]);
                plot3(x,y,z,'r'); hold on;
            end
        end
    end
end

label_axes();
axis equal

end

function [x,y,z]=get_xyz(x_,y_,z_)

x=y_;
y=x_;
z=-z_;

end

function label_axes()

xlabel('E');
ylabel('N');
zlabel('Up');

end

function path_duration = get_path_duration(initial_ned,final_ned)

v_horiz = 3;
v_zmax = 1;
v_zmin = -2;

dist_horiz = norm(final_ned(:,1:2)-initial_ned(:,1:2));
duration_horiz = dist_horiz/v_horiz;

disp_vert = final_ned(:,3)-initial_ned(:,3);
if disp_vert<0
    duration_vert = disp_vert/v_zmin;
else
    duration_vert = disp_vert/v_zmax;
end

path_duration = max(duration_vert,duration_horiz);

end