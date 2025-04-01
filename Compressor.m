function [state_out, L_C] = Compressor(state_in,char)
% psi：熵函数
pi = char(1);
eta = char(2);
p_in = state_in(2);
h_in = state_in(3);
psi_in = state_in(4);

% 压气机出口的总压
p_out = p_in*pi;

% 压气机出口的理想熵函数为
psi_out_i = psi_in + log10(pi);

% 由变比热拟合公式求得压气机出口的理想温度、焓为
T_out_i = calculate_T_from_psi(psi_out_i);
h_out_i = calculate_H_from_T(T_out_i);

% 根据压气机效率定义
h_out = h_in + (h_out_i - h_in)/eta;

% 根据变比热拟合公式
T_out = calculate_T_from_H(h_out);

% 压气机消耗的功为
L_C = h_out - h_in;

% 压气机出口的实际熵函数
psi_out = calculate_psi_from_T(T_out);

state_out(1) = T_out;
state_out(2) = p_out;
state_out(3) = h_out;
state_out(4) = psi_out;
end