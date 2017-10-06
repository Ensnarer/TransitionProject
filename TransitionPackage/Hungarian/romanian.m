function assignments=romanian(formation1_ned,formation2_ned)
% assignments is such that if the i'th drone of formation1 goes to the j'th
% position of formation2, j=assignments(i)

n=size(formation1_ned,1);
if n~=size(formation2_ned,1);
    error('input formations must be the same size');
end

% generate distance matrix
cost_matrix=generate_cost_matrix(formation1_ned,formation2_ned);

% recursive function
assignments_paired=recursive_eliminate_highest_cost(cost_matrix);

% ensure assignments is a column vector
if size(assignments_paired,1)==1
    assignments_paired=assignments_paired';
end

assignments=zeros(n,1);
for i=1:n
    assignments(assignments_paired(i,1)) = assignments_paired(i,2);
end

end

function assignments=recursive_eliminate_highest_cost(cost_matrix)

n=size(cost_matrix,1);
if n==1
    assignments = [1 1];
    return; 
end

lowest_cost_in_each_row=zeros(n,2);% first column will be value, second column index
for i=1:n
    [lowest_cost_in_each_row(i,1),lowest_cost_in_each_row(i,2)] = min(cost_matrix(i,:));
end

[~,assign_i]=max(lowest_cost_in_each_row(:,1));
assign_j = lowest_cost_in_each_row(assign_i,2);

reduced_cost_matrix = cost_matrix;
reduced_cost_matrix(assign_i,:)=[];
reduced_cost_matrix(:,assign_j)=[];

reduced_assignments=recursive_eliminate_highest_cost(reduced_cost_matrix);

idx=find(reduced_assignments(:,1)>=assign_i);
reduced_assignments(idx,1)=reduced_assignments(idx,1)+1;

idx=find(reduced_assignments(:,2)>=assign_j);
reduced_assignments(idx,2)=reduced_assignments(idx,2)+1;

assignments=[...
    assign_i assign_j;
    reduced_assignments];

end



function D=generate_cost_matrix(formation1_ned,formation2_ned)

n=size(formation1_ned,1);
D=zeros(n,n);
for i=1:n
    for j=1:n
        initial_ned = formation1_ned(i,:);
        final_ned = formation2_ned(j,:);
        D(i,j) = get_path_duration(initial_ned,final_ned);
    end
end

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