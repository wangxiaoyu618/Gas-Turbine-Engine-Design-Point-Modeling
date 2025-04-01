function [state_out,F] = Inter_Nozzle(state_in,epsilon,m,p0,f)
R = 287;
T_in_g = state_in(1);
p_in_g = state_in(2);
h_in_g = state_in(3);

p_out_g = epsilon*p_in_g;
h_out_g = h_in_g;
theta_h_out = calculate_theta_h_from_H(h_out_g);
h_out = h_out_g - (f/(1 + f)) * theta_h_out;
T_out_g = calculate_T_from_H(h_out);

kg = 1.3;
km = sqrt(kg/R*(2/(kg+1))^((kg+1)/(kg-1)));
lamda_in = 1;
q_lamda_in = ((kg+1)/2)^(1/(kg-1))*lamda_in*(1 - (kg-1)/(kg+1)*lamda_in^2)^(1/(kg-1));
area_in = m*sqrt(T_in_g)/km/p_in_g/q_lamda_in;
p_outs_g = p0;
pi_lamda = p_outs_g/p_out_g;
lamda_out = sqrt((kg+1)/(kg-1)*(1-pi_lamda^((kg-1)/kg)));
q_lamda_out = ((kg+1)/2)^(1/(kg-1))*lamda_out*(1 - (kg-1)/(kg+1)*lamda_out^2)^(1/(kg-1));
area_out = m*sqrt(T_out_g)/km/p_out_g/q_lamda_out;
if area_out/area_in>3
    area_out = 3*area_in;
    q_lamda_out = m*sqrt(T_out_g)/km/p_out_g/area_out;
    lamda_out = solve('((kg+1)/2)^(1/(kg-1))*lamda9*(1 - (kg-1)/(kg+1)*lamda9^2)^(1/(kg-1))=q_lamda9');
    lamda_out = double(lamda_out);
    pi_lamda = (1 - (kg7-1)/(kg7+1)*lamda_out^2)^(kg7/(kg7-1));
    p_outs_g = p_out_g*pi_lamda;
end
tao_lamda = 1 - (kg-1)/(kg+1)*lamda_out^2;
T_outs_g = T_out_g*tao_lamda;
psi_out_g = calculate_psi_from_T(T_out_g) + (f/(1 + f)) * calculate_theta_psi_from_T(T_out_g);
h_outs_g = calculate_H_from_T(T_outs_g) + (f/(1 + f)) * calculate_theta_h_from_T(T_outs_g);
c = 0.98*sqrt(2*(h_out_g - h_outs_g));
F = m*c + (p_outs_g - p0)*area_out;
state_out(1) = T_out_g;
state_out(2) = p_out_g;
state_out(3) = h_out_g;
state_out(4) = psi_out_g;
end