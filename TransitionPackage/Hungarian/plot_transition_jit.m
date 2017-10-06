function plot_transition_jit(formation1_ned,formation2_ned,assignments,dt,L)
% plots the just-in-time transition from formation1 to formation2

figure;

n=size(formation1_ned,1);

for i=1:n
    j=assignments(i);
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

for t=0:dt:1
    ned=zeros(n,3);
    for i=1:n
        j=assignments(i);
        
        ned(i,:) = vector_linear_interpolation(0,1,...
            formation1_ned(i,:),formation2_ned(j,:),...
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