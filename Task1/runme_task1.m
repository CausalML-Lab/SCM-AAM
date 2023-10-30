clc
clear
warning off
iter=  input('Enter total number of iterations (Min 20 for consistent results ) ');
Horizon =  input('Enter the Horizon (Min 100) ');
fprintf('Takes some time to run all the algorithms and plot results')
reward = SCM_AAM_task1(iter,Horizon);

reg = 0.77-reward;
options.marker = "-^";
options.color_line = [179, 63, 64]./255 ;
options.color_area = options.color_line + (1-options.color_line)*2.3/4 ;
options.x_axis = [1:1:Horizon];
reg = cumsum(reg,2);
plot_areaerrorbar(reg,options);


reward = pomis_klucb_task1(iter,Horizon);

hold on
reg = 0.77-reward;
options.marker = "-square";
options.color_line = [01, 119, 179]./255 ;
options.color_area = options.color_line + (1-options.color_line)*2.3/4 ;
options.x_axis = [1:1:Horizon];
reg = cumsum(reg,2);
plot_areaerrorbar(reg,options)
grid on
xlabel('Time',"Interpreter","latex")
ylabel('Cumulative Regret',"Interpreter","latex")





reward = pomis_ucb_task1(iter,Horizon);
options.marker = "-o";
options.color_line = [72, 161, 77]./255 ;
options.color_area = options.color_line + (1-options.color_line)*2.3/4 ;
options.x_axis = [1:1:Horizon];
reg = 0.77-reward;
reg = cumsum(reg,2);
plot_areaerrorbar(reg,options)
ylim([0 100])



reward = TS_task1(iter,Horizon);
options.marker = "-diamond";
options.color_line = [0.83,0.09,1.00] ;
options.color_area = options.color_line + (1-options.color_line)*2.3/4 ;
options.x_axis = [1:1:Horizon];
reg = 0.77-reward;
reg = cumsum(reg,2);
plot_areaerrorbar(reg,options)
legend("","SCM-AAM","","KL-UCB on POMISs","","UCB on POMISs","","TS on POMISs","Interpreter","latex")
