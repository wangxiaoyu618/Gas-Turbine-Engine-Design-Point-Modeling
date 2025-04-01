function [state_out, mf, f] = combust(T4,state_in,m_air,epsilon)

T_in = state_in(1);
p_in = state_in(2);
Tt3 = T_in;
Tt4 = T4;

% 计算油气比修正系数和油气比
theta_f = 0.97*42900/(0.98*42900); 
f = theta_f * ((0.0110966 + 0.197799e-4 * Tt4 + 0.495727e-8 * Tt4^2) +...
    (5 - 0.01 * Tt3) * (0.00258 + 0.2e-6 * Tt4));

% 计算燃烧室出口燃气总焓和总熵
% 总焓
h_out = calculate_H_from_T(Tt4);
theta_h_out = calculate_theta_H_from_T(Tt4);
h_out_g = h_out + (f/(1 + f)) * theta_h_out;
% 总熵
psi_out = calculate_psi_from_T(Tt4);
theta_psi_out = calculate_theta_psi_from_T(Tt4);
psi_out_g = psi_out + (f/(1 + f)) * theta_psi_out;

T_out_g = Tt4;
p_out_g = p_in * epsilon;

state_out(1) = T_out_g;
state_out(2) = p_out_g;
state_out(3) = h_out_g;
state_out(4) = psi_out_g;
mf = f * m_air;
end