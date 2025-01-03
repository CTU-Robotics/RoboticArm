% 6DOF Robotic Arm - Computed Torques Control

%% FOR YOU TO CHANGE
% Mass variables
    m_link1 = 1.8;
    m_link2 = 1.8;
    m_link3 = 1;
    m_link4 = 0.2;
    m_grip = 0.1;

    m_sample = 0.1;

% lengths
    L_base = 0.05/2;
    L_link1 = 0.45;
    L_link2 = 0.45;
    L_link3 = 0.1;
    L_link4 = 0.2;
    L_grip = 0.025;

% Initial position
    fi120 = 0;
    fi230 = pi/2;
    fi340 = pi/2;
    fi450 = 0;
    fi560 = 0;
    fi670 = 0;

% Maximal acceleration
    a_x = 0.5; % acceleration in x
    a_y = 0.5;
    a_z = 0.5;
    alf_x = 0.5; % angular acc around x
    alf_y = 0.5;
    alf_z = 0.5;

% Display animation?
    Anim_ON = 1;



















%%%%%%%%%%%%%%%%%%%
%% DO NOT CHANGE %%
tsim = 6;
t_delay = 2;

close;

% CTC
    Kp = diag(50*ones(6,1));
    Kd = diag(10*ones(6,1));

if Anim_ON
    set_param('DOF6_CTC2', 'SimMechanicsOpenEditorOnUpdate', 'on');
    out = sim("DOF6_CTC2.slx");
else
    set_param('DOF6_CTC2', 'SimMechanicsOpenEditorOnUpdate', 'off');
    out = sim('DOF6_CTC2.slx');
end


data = out.Torque;

time = data.Time;
trq = data.Data;

indices = time < t_delay;

time(indices) = [];
trq(indices,:) = [];

%%
figure
for i = 1:6
    subplot(3,2,i)
    plot(time,trq(:,i))
    xlabel('Time [s]')
    ylabel('Torque [Nm]')
    grid on

    if i == 1
        title("Torque of the " + num2str(i) + "st motor")
    elseif i ==2
        title("Torque of the " + num2str(i) + "nd motor")
    elseif i ==3
        title("Torque of the " + num2str(i) + "rd motor")
    else
        title("Torque of the " + num2str(i) + "th motor")
    end
    
end





