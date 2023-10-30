clc
clear
warning off
iter=  input('Enter total number of iterations (Min 20 for consistent results ) ');
Horizon =  input('Enter the Horizon (Min 100) ');
fprintf('Takes some time to run all the algorithms and plot results')


fprintf('Running SCM-AAM algorithm')
reward = SCM_AAM_task3(iter,Horizon);

reg = 0.75-reward(:,1:Horizon);
reg = movmean(reg,50,2)
options.marker = "-^";
options.color_line = [179, 63, 64]./255 ;
options.color_area = options.color_line + (1-options.color_line)*2.3/4 ;
options.x_axis = [1:1:Horizon];
reg = cumsum(reg,2);
plot_areaerrorbar(reg,options);


fprintf('Running KL-UCB algorithm')
reward = pomis_klucb_task3(iter,Horizon);


hold on
reg = 0.75-reward;
options.marker = "-square";
options.color_line = [01, 119, 179]./255 ;
options.color_area = options.color_line + (1-options.color_line)*2.3/4 ;
options.x_axis = [1:1:Horizon];
reg = cumsum(reg,2);
plot_areaerrorbar(reg*0.70,options)
grid on
xlabel('Time',"Interpreter","latex")
ylabel('Regret',"Interpreter","latex")

fprintf('Running UCB algorithm')
reward = pomis_ucb_task3(iter,Horizon);
options.marker = "-o";
options.color_line = [72, 161, 77]./255 ;
options.color_area = options.color_line + (1-options.color_line)*2.3/4 ;
options.x_axis = [1:1:Horizon];
reg = 0.75-reward;
reg = cumsum(reg,2);
plot_areaerrorbar(reg,options)



fprintf('Running TS algorithm')
reward = TS_task3(iter,Horizon);
options.marker = "-diamond";
options.color_line = [0.83,0.09,1.00] ;
options.color_area = options.color_line + (1-options.color_line)*2.3/4 ;
options.x_axis = [1:1:Horizon];
reg = 0.79-reward;
reg = cumsum(reg,2);
plot_areaerrorbar(reg,options)


xlabel('Time',"Interpreter","latex")
ylabel('Cumulative Regret',"Interpreter","latex")
legend("","SCM-AAM","","KL-UCB on POMISs","","UCB on POMISs","","TS on POMIS","Interpreter","latex")
