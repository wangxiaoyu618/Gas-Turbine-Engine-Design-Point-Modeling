function [state_out,m_out] = mix(state_in1,state_in2,m1,m2,f,ratio)
% T_in1_g 混合器进口燃气温度(高压涡轮出口燃气温度)
% p_in1_g 混合器进口燃气压力(高压涡轮出口燃气压力)
% T_in2 压气机引气温度
% cp_state_in2 压气机引气比热
% T_out_g 混合器出口燃气温度
% p_out_g 混合器出口燃气压力
% h_out_g 混合器出口燃气焓
% psi_out_g 混合器出口燃气熵函数
% cp_out 混合器出口空气比热
% cp_out_g 混合器出口燃气比热

T_in1_g = state_in1(1);
T_in2 = state_in2(1);
p_in1_g = state_in1(2);

cp_state_in2 = calculate_cp_from_T(T_in2);
T_out_g = T_in1_g;
for i = 1:10
    cp_out = calculate_cp_from_T(T_out_g);
    theta_cp_out = calculate_theta_cp_from_T(T_out_g);
    cp_out_g = cp_out + (f/(1 + f)) * theta_cp_out;
    T_out_g(I) = (cp_state_in2/cp_out_g) * (m2/(m1 + m2)) * ratio * T_in2 + (m1/(m1 + m2)) * T_in1_g;
    if i > 1 && abs(T_out_g(i) - T_out_g) < 0.1
        break
    end
    T_out_g = T_out_g(i);
end

p_out_g = p_in1_g;
h_out = calculate_H_from_T(T_out_g);
theta_h = calculate_theta_h_from_T(T_out_g);
h_out_g = h_out + (f/(1 + f)) * theta_h;
psi_out = calculate_psi_from_T(T_out_g);
theta_psi = calculate_theta_psi_from_T(T_out_g);
psi_out_g = psi_out + (f/(1 + f)) * theta_psi;

state_out(1) = T_out_g;
state_out(2) = p_out_g;
state_out(3) = h_out_g;
state_out(4) = psi_out_g;
m_out = m1 + m2;
end