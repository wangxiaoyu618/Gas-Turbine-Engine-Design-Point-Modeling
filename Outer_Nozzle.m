function [state_out,F] = Outer_Nozzle(state_in,epsilon,m,p0)
R = 287;
T_in = state_in(1);
p_in = state_in(2);
h_in = state_in(3);
psi_in = state_in(4);
p_out = epsilon*p_in;
h_out = h_in;
T_out = calculate_T_from_H(h_out);

kg = 1.4;
km = sqrt(kg/R*(2/(kg+1))^((kg+1)/(kg-1)));
lamda_in = 1;
q_lamda_in = ((kg+1)/2)^(1/(kg-1))*lamda_in*(1 - (kg-1)/(kg+1)*lamda_in^2)^(1/(kg-1));
area_in = m*sqrt(T_in)/km/p_in/q_lamda_in;
p_outs = p0;
pi_lamda = p_outs/p_out;
lamda_out = sqrt((kg+1)/(kg-1)*(1-pi_lamda^((kg-1)/kg)));
q_lamda_out = ((kg+1)/2)^(1/(kg-1))*lamda_out*(1 - (kg-1)/(kg+1)*lamda_out^2)^(1/(kg-1));
area_out = m*sqrt(T_out)/km/p_out/q_lamda_out;
if area_out/area_in>3
    area_out = 3*area_in;
    q_lamda_out = m*sqrt(T_out)/km/p_out/area_out;
    lamda_out = solve('((kg+1)/2)^(1/(kg-1))*lamda9*(1 - (kg-1)/(kg+1)*lamda9^2)^(1/(kg-1))=q_lamda9');
    lamda_out = double(lamda_out);
    pi_lamda = (1 - (kg7-1)/(kg7+1)*lamda_out^2)^(kg7/(kg7-1));
    p_outs = p_out*pi_lamda;
end
tao_lamda = 1 - (kg-1)/(kg+1)*lamda_out^2;
T_outs = T_out*tao_lamda;
psi_out = calculate_psi_from_T(T_out);
h_outs = calculate_H_from_T(T_outs);
c = 0.98*sqrt(2*(h_out - h_outs));
F = m*c + (p_outs - p0)*area_out;
state_out(1) = T_out;
state_out(2) = p_out;
state_out(3) = h_out;
state_out(4) = psi_out;
end