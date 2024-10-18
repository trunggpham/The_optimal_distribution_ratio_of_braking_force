clc
clear 
close all

% Problem
nVar = 2; %number of variable
VarMin = [0.15 0.15]; %lower bound of variable
VarMax = [1 0.8]; %upper bound of variable

%% PSO parameters
MaxIter = 500; % max number of iterations 
nPop = 50; % populations size
w = 1;% inertia - quan tinh
d = 0.99; % damping ratio of the inertia
c1 = 2; % acceleration 1
c2 = 2; % acceleration 2

%% Initial
x0.position = [];
x0.velocity = [];
x0.fitness = [];
x0.best.position = [];
x0.best.fitness = [];
x = repmat(x0, nPop, 1); % make a population
global_best.position = -inf;
global_best.fitness = -inf;
% Generate initial population
for i = 1:nPop
    %generate random solution
    for k = 1:nVar
        if i == 1
            x(i).position = [0.5,0.5];
        else
            x(i).position(k) = unifrnd(VarMin(k),VarMax(k));
        end
    end
    x(i).velocity = zeros([1 nVar]); % initial velocity
    x(i).fitness = objective_function(x(i).position);
    x(i).best.position = x(i).position;
    x(i).best.fitness = x(i).fitness;
    %E(i,:)=x(i).best.fitness > global_best.fitness;
    if x(i).best.fitness > global_best.fitness
        global_best = x(i).best;
    end
end

%% 
%% Main program
B = zeros(MaxIter,3); %Save the best fitness in each iteration
C = zeros(MaxIter,nVar);
for j = 1:MaxIter
    for i = 1:nPop
        x(i).velocity = w*x(i).velocity + c1*rand([1 nVar]).*(x(i).best.position - x(i).position) + c2*rand([1 nVar]).*(global_best.position - x(i).position); % update position
        x(i).position = x(i).position + x(i).velocity;
        %disp(['end-' num2str(i)]);
        % check the range
        for k = 1:nVar
            if x(i).position(k) < VarMin(k)
                x(i).position(k) = VarMin(k);
            end
            if x(i).position(k) > VarMax(k)
                x(i).position(k) = VarMax(k);
            end
        end
        x(i).fitness = objective_function(x(i).position);
        if x(i).fitness > x(i).best.fitness
            x(i).best.position = x(i).position; % update the personal best
            x(i).best.fitness = x(i).fitness;
            if x(i).best.fitness > global_best.fitness
                global_best = x(i).best; % update the global best
            end
        end
    end
    w = w*d; % update the damping ration
    % save best fitness
    B(j,:) = global_best.fitness;
    C(j,:) = global_best.position;
    %disp(['Iteration ' num2str(j) '; Best fitness = ' num2str(B(300)) '; Optimal solution (L, W, H) =' num2str(C(300,:))]);
    %plot(B(1:j,1), 'r.');
end
%disp(['Iteration ' num2str(j) '; Best fitness = ' num2str(B(1,:)) '; Optimal solution (a,b) =' num2str(C(1,:))]);
%disp(['Iteration ' num2str(j) '; Best fitness = ' num2str(B(300,:)) '; Optimal solution (a,b) =' num2str(C(300,:))]);
%}