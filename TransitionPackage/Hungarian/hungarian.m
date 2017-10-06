function assignments=hungarian(formation1_ned,formation2_ned)
% assignments is such that if the i'th drone of formation1 goes to the j'th
% position of formation2, j=assignments(i)

n=size(formation1_ned,1);
if n~=size(formation2_ned,1);
    error('input formations must be the same size');
end

% generate distance matrix
D=generate_distance_matrix(formation1_ned,formation2_ned);

[assignments] = munkres(D); 

% ensure assignments is a column vector
if size(assignments,1)==1
    assignments=assignments';
end

end

function D=generate_distance_matrix(formation1_ned,formation2_ned)

n=size(formation1_ned,1);
for i=1:n
    for j=1:n
        D(i,j)=norm(formation1_ned(i,:) - formation2_ned(j,:));
    end
end

end