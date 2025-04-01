function [state_out] = Turbine(state_in, eta_T, eta_m, L_C, f, delta)
% 输入参数说明：
% state_in - 进口状态 [T_in, p_in, h_in,s_in]
% eta_T - 涡轮效率
% eta_m - 机械效率
% L_C - 压气机功
% f - 油气比
% delta - 冷却空气系数(ratio)

p_in_g = state_in(2);
h_in_g = state_in(3);
psi_in_g = state_in(4); 

% 计算涡轮功
L_T = L_C/(eta_m * (1 + f - delta));

% 计算涡轮出口燃气总焓
h_out_g = h_in_g - L_T/eta_T; 

% 迭代计算出口空气焓和温度
h_out_prev = h_out_g; % 初始假设燃气焓值=空气焓值计算修正系数
for i = 1:10
    theta_h_out = calculate_theta_H_from_H(h_out_prev);
    h_out = h_out_g - (f/(1 + f)) * theta_h_out;
    if i >1 && abs(h_out - h_out_prev) < 0.1
        break;
    end
    h_out_prev = h_out;
end

% 计算涡轮出口温度
T_out_g = calculate_T_from_H(h_out);

% 计算熵函数和落压比
psi_out = calculate_psi_from_T(T_out_g);
theta_psi_out = calculate_theta_psi_from_T(T_out_g);
psi_out_g = psi_out + (f/(1 + f)) * theta_psi_out;

% 计算落压比
pi_T = 10^(psi_in_g - psi_out_g);
p_out_g = p_in_g/pi_T;

state_out(1) = T_out_g;
state_out(2) = p_out_g;
state_out(3) = h_out_g;
state_out(4) = psi_out_g;
end