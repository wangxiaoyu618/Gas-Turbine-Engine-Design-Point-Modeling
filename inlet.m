function [state_out] = inlet(Ma,T_in,p_in)
% psi:熵函数

if Ma <= 1
    epsilon_i = 0.995;%进气道总压恢复系数
else
    epsilon_i = 0.995*(1 - 0.075*(Ma-1)^1.35);
end

T_out = T_in;
p_out= p_in*epsilon_i;
h_out = calculate_H_from_T(T_out);
psi_out = calculate_psi_from_T(T_out);

state_out(1) = T_out;
state_out(2) = p_out;
state_out(3) = h_out;
state_out(4) = psi_out;
end