clear
%环境
H = 0;
Ma = 0;
m_air = 210.5;
[T0,p0,Tt0,pt0,c0] = env(H,Ma);
%进气道
%par参数存储温度、压力、焓、熵函数(用熵函数代替熵)
par_1 = inlet(Ma,T0,p0);
%风扇
B = 1.381;
fan_d1 = [1.7776,0.591]; % 压力比和等熵效率(内涵)
fan_d2 = [1.7776,0.591]; % (外涵)
% 内涵参数
[par_2, L_Fan_core] = Compressor(par_1,fan_d1);
m_c = m_air/(B+1); % 内涵空气流量
%外涵参数
[par_B12, L_Fan_bypass] = Compressor(par_1,fan_d2);
m_B = m_air - m_c; % 外涵空气流量
%中压压气机(增压级)
IP_d = [2.4231,0.8928];
[par_25, L_IPC] = Compressor(par_2,IP_d);
m_25 = m_c;
%高压压气机
HP_d = [3.1746,0.899];
[par_3, L_HPC] = Compressor(par_25,HP_d);
ratio = 0;
%压气机引冷却气
m_3 = m_25*(1-ratio);
par_bleed = par_3;
m_bleed1 = 0*m_25;
m_bleed2 = 0*m_25;
input_P = 0;
%燃烧室
T4 = 1098.42;
epsilon = 0.95; % 燃烧室总压恢复系数
[par_4, mf, f] = combust(T4, par_3, m_3, epsilon);
m_4 = m_3 + mf;
% 涡轮参数
eta_mH = 0.98;
eta_HT = 0.9;
eta_LT = 0.9;
% 高压涡轮
[par_45, HT_d] = Turbine(par_4, eta_HT, eta_mH, L_HPC, f, ratio);
m_45 = m_4;
%涡轮后冷气掺混(Blade)
[par_45r, m_45r] = mix(par_45, par_bleed, m_45, m_bleed2, f, ratio);
%低压涡轮
[par_5,LT_d] = Turbine(par_45r,eta_LT,eta_mH,L_Fan_core + L_Fan_bypass + L_IPC,ratio);
m_5 = m_45r;
%外涵
par_B13(3) = par_B12(3);
par_B13(2) = 0.99*par_B12(2);
par_B13(1) = calculate_T_from_H(par_B13(3));
par_B13(4) = calculate_psi_from_T(par_B13(1));
%喷管
[par_6,F1] = Inter_Nozzle(par_5,0.98,m_5,p0,f);
[par_B14,F2] = Outer_Nozzle(par_B13,0.98,m_B,p0);
F_net = F1+F2 - m_air*c0;
SFC = 3600*mf/(F_net/10);
F_s = F_net/m_air;
