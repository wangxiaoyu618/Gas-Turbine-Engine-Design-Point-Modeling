% --- Thermodynamic Properties 
% IMPORTANT:
% 1. UNITS(T in K, H in kJ/kg, cp in kJ/(kg*K)). Verify units.

function cp = calculate_cp_from_T(T)
% Calculates Specific Heat (cp) as a function of Temperature (T).
% Assumed Units: T(K), cp(kJ/(kg*K))

    if T >= 200 && T <= 400
        cp = 1.02128 - 0.174035e-3 * T + 0.381144e-6 * T^2;
    elseif T > 400 && T <= 600
        cp = 1.00972 - 0.113200e-3 * T + 0.301630e-6 * T^2;
    elseif T > 600 && T <= 800
        cp = 0.904050 + 0.243081e-3 * T; 
    elseif T > 800 && T <= 1000
        cp = 0.871588 + 0.282407e-3 * T + 0.576188e-7 * T^2 - 0.710033e-10 * T^3;
    elseif T > 1000 && T <= 1200
        cp = 0.801067 + 0.347583e-3 * T + 0.278064e-6 * T^2 - 0.430102e-9 * T^3 + 0.144096e-12 * T^4;
    elseif T > 1200 && T <= 1400
        cp = 0.904375 + 0.307099e-3 * T - 0.685764e-7 * T^2;
    elseif T > 1400 && T <= 1600
        cp = 0.818432 + 0.338213e-3 * T - 0.113955e-6 * T^2 + 0.267879e-9 * T^3 - 0.248127e-12 * T^4 + 0.649470e-16 * T^5;
    elseif T > 1600 && T <= 1800
        cp = 1.08274 + 0.540254e-4 * T + 0.400880e-7 * T^2 - 0.126442e-10 * T^3;
    elseif T > 1800 && T <= 2000
        cp = 1.11091 + 0.696051e-4 * T; 
    else
        error('Temperature T = %.2f K is outside the valid range [200, 2000] K for cp(T).', T);
    end
end

function theta_cp = calculate_theta_cp_from_T(T)
% Calculates property theta_cp as a function of Temperature (T).
% Assumed Units: T(K), theta_cp(kJ/kg*K)

    if T >= 200 && T <= 400
        theta_cp = -0.422243 + 0.562485e-2 * T - 0.445171e-5 * T^2;
    elseif T > 400 && T <= 600
        theta_cp = -0.352138e-1 + 0.373632e-2 * T - 0.213629e-5 * T^2; 
    elseif T > 600 && T <= 800
        theta_cp = 0.706997 + 0.887472e-3 * T + 0.983382e-6 * T^2 - 0.710444e-9 * T^3; 
    elseif T > 800 && T <= 1000
        theta_cp = 0.719467 + 0.121709e-2 * T + 0.539074e-7 * T^2 - 0.878332e-10 * T^3;
    elseif T > 1000 && T <= 1200
        theta_cp = -1.28989 - 0.242766e-3 * T + 0.115149e-5 * T^2 - 0.176641e-8 * T^3 - 0.118922e-12 * T^4;
    elseif T > 1200 && T <= 1400
        theta_cp = 0.144265 + 0.289310e-2 * T - 0.187051e-5 * T^2 + 0.960367e-9 * T^3 - 0.230206e-12 * T^4;
    elseif T > 1400 && T <= 1600
        theta_cp = 0.262837 + 0.207506e-2 * T - 0.453275e-6 * T^2;
    elseif T > 1600 && T <= 1800
        theta_cp = 0.361045 + 0.146492e-2 * T + 0.485405e-6 * T^2 - 0.557200e-9 * T^3 + 0.115616e-12 * T^4;
    elseif T > 1800 && T <= 2000
        theta_cp = 1.51589 + 0.683602e-3 * T - 0.157660e-6 * T^2 + 0.828781e-10 * T^3 - 0.851090e-14 * T^4 - 0.499222e-17 * T^5;
    else
        error('Temperature T = %.2f K is outside the valid range [200, 2000] K for theta_s(T).', T);
    end
end

function H = calculate_H_from_T(T)
% Calculates Enthalpy (H) as a function of Temperature (T).
% Assumed Units: T(K), H(kJ/kg)

    if T >= 200 && T <= 400
        H = -1.04758 + 1.00415 * T;
    elseif T > 400 && T <= 600
        H = 3.59694 + 0.968196 * T + 0.610914e-4 * T^2;
    elseif T > 600 && T <= 800
        H = 153.977 + 0.336079 * T + 0.924064e-3 * T^2 - 0.376406e-6 * T^3;
    elseif T > 800 && T <= 1000
        H = 71.6731 + 0.710183 * T + 0.364838e-3 * T^2 - 0.101180e-6 * T^3;
    elseif T > 1000 && T <= 1200
        H = 0.321975e3 + 0.469811e-1 * T + 0.939525e-3 * T^2 - 0.262836e-6 * T^3; 
    elseif T > 1200 && T <= 1400
        H = -643.044 + 2.34784 * T - 0.905855e-4 * T^2 + 0.235443e-6 * T^3; 
    elseif T > 1400 && T <= 1600
        H = 250.858 + 0.197996 * T + 0.927851e-3 * T^2 - 0.421149e-6 * T^3 + 0.983889e-10 * T^4 - 0.101219e-13 * T^5;
    elseif T > 1600 && T <= 1800
        H = -0.208086e3 + 1.22790 * T; 
    elseif T > 1800 && T <= 2000
        H = -0.234822e3 + 1.24281 * T; 
    else
        error('Temperature T = %.2f K is outside the valid range [200, 2000] K for H(T).', T);
    end
end

function T = calculate_T_from_H(H)
% Calculates Temperature (T) as a function of Enthalpy (H).
% Assumed Units: H(kJ/kg), T(K)

    if H >= 199.92 && H <= 400.84 % Corresponds to T=200-400
        T = 1.25969 + 1.01180 * H - 0.265320e-4 * H^2;
    elseif H > 400.84 && H <= 606.74 % Corresponds to T=400-600
        T = -13.8453 + 1.07211 * H - 0.997530e-4 * H^2;
    elseif H > 606.74 && H <= 821.60 % Corresponds to T=600-800
        T = 18.7787 + 1.08538 * H - 0.108229e-3 * H^2;
    elseif H > 821.60 && H <= 1045.62 % Corresponds to T=800-1000
        T = 27.1498 + 0.979141 * H - 0.464182e-4 * H^2;
    elseif H > 1045.62 && H <= 1277.26 % Corresponds to T=1000-1200
        T = 97.4929 + 0.863570 * H;
    elseif H > 1277.26 && H <= 1514.76 % Corresponds to T=1200-1400
        T = 0.154327e4 - 2.25498 * H + 0.225047e-2 * H^2 - 0.544217e-6 * H^3; 
    elseif H > 1514.76 && H <= 1758.78 % Corresponds to T=1400-1600
        T = 406.732 + 0.353506 * H + 0.277998e-3 * H^2 - 0.458118e-7 * H^3 - 0.391075e-11 * H^4;
    elseif H > 1758.78 && H <= 2002.44 % Corresponds to T=1600-1800
        T = 0.467930e3 + 0.449118 * H + 0.557083e-4 * H^2 + 0.709639e-7 * H^3 - 0.224201e-10 * H^4; 
    elseif H > 2002.44 && H <= 2251.07 % Corresponds to T=1800-2000
        T = 0.189498e3 + 0.804365 * H;
    else
        error('Enthalpy H = %.2f kJ/kg is outside the valid range [199.92, 2251.07] kJ/kg for T(H).', H);
    end
end

function theta_H = calculate_theta_H_from_T(T)
% Calculates property theta_H as a function of Temperature (T).
    if T >= 200 && T <= 400
        theta_H = 27.5217 - 0.354159e-1 * T + 0.676443e-3 * T^2 + 0.350853e-5 * T^3 - 0.423513e-8 * T^4; 
    elseif T > 400 && T <= 600
        theta_H = -9.59243 + 0.131688e-1 * T + 0.177174e-2 * T^2 - 0.645877e-6 * T^3; 
    elseif T > 600 && T <= 800
        theta_H = -88.3837 + 0.461719 * T + 0.950354e-4 * T^2 - 0.157821e-6 * T^3;
    elseif T > 800 && T <= 1000
        theta_H = -7.90165 + 0.227548 * T + 0.116894e-3 * T^2 - 0.221669e-7 * T^3;
    elseif T > 1000 && T <= 1200
        theta_H = -160.747 + 0.884484 * T + 0.175335e-3 * T^2 + 0.408376e-6 * T^3 - 0.140527e-9 * T^4;
    elseif T > 1200 && T <= 1400
        theta_H = -0.456898e2 + 1.42387 * T - 0.135121e-2 * T^2 + 0.158012e-5 * T^3 - 0.424127e-9 * T^4; 
    elseif T > 1400 && T <= 1600
        theta_H = -186.530 + 0.718494 * T + 0.978720e-3 * T^2 - 0.636652e-6 * T^3 + 0.389184e-9 * T^4 - 0.892726e-13 * T^5;
    elseif T > 1600 && T <= 1800
        theta_H = 0.215169e2 - 1.65778 * T + 0.369666e-4 * T^2 + 0.128055e-5 * T^3 - 0.360564e-9 * T^4; 
    elseif T > 1800 && T <= 2000
        theta_H = 5.36480 + 0.434211 * T + 0.104820e-2 * T^2 - 0.334698e-6 * T^3 + 0.923184e-10 * T^4 - 0.115330e-13 * T^5;
    else
        error('Temperature T = %.2f K is outside the valid range [200, 2000] K for theta_H(T).', T);
    end
end

function theta_H = calculate_theta_H_from_H(H)
% Calculates property theta_H as a function of Enthalpy (H).

    if H >= 199.92 && H <= 400.84 % Corresponds to T=200-400
        theta_H = 66.3716 - 0.555975 * H + 0.323745e-2 * H^2 - 0.195572e-5 * H^3;
    elseif H > 400.84 && H <= 606.74 % Corresponds to T=400-600
        theta_H = -91.0366 + 0.547914 * H + 0.539387e-3 * H^2 + 0.492806e-6 * H^3 - 0.311683e-9 * H^4 - 0.135911e-12 * H^5;
    elseif H > 606.74 && H <= 821.60 % Corresponds to T=600-800
        theta_H = 203.386 + 0.948716 * H + 0.318935e-4 * H^2 + 0.309853e-7 * H^3;
    elseif H > 821.60 && H <= 1045.62 % Corresponds to T=800-1000
        theta_H = -0.206027e3 + 0.949191 * H + 0.348278e-3 * H^2; 
    elseif H > 1045.62 && H <= 1277.26 % Corresponds to T=1000-1200
        theta_H = 167.518 + 0.904382 * H + 0.263924e-4 * H^2 + 0.160069e-6 * H^3 - 0.692738e-10 * H^4;
    elseif H > 1277.26 && H <= 1514.76 % Corresponds to T=1200-1400
        theta_H = -0.370396e4 + 8.50401 * H - 0.505042e-2 * H^2 + 0.127102e-5 * H^3; 
    elseif H > 1514.76 && H <= 1758.78 % Corresponds to T=1400-1600
        theta_H = 14.6551 + 1.11999 * H - 0.556129e-3 * H^2 + 0.785352e-6 * H^3 - 0.251756e-9 * H^4 + 0.208675e-13 * H^5;
    elseif H > 1758.78 && H <= 2002.44 % Corresponds to T=1600-1800
        % OCR shows 0= 0.177758x10?+ 0.602369H ... Constant term?
        % Assuming 0.177758e3 based on magnitudes.
        theta_H = 0.177758e3 + 0.602369 * H + 0.244828e-3 * H^2 + 0.188526e-6 * H^3 - 0.565358e-10 * H^4; 
    elseif H > 2002.44 && H <= 2251.07 % Corresponds to T=1800-2000
        theta_H = -0.292739e3 + 0.932162 * H + 0.483915e-3 * H^2 - 0.677461e-7 * H^3; 
    else
        error('Enthalpy H = %.2f kJ/kg is outside the valid range [199.92, 2251.07] kJ/kg for theta_H(H).', H);
    end
end

function psi = calculate_psi_from_T(T)
% Calculates property psi (ψ) as a function of Temperature (T).
% Assumed Units: T(K), psi(kJ/(kg*K)?)

    if T >= 200 && T <= 400
        psi = 7.80201 + 0.104143e-1 * T - 0.871623e-5 * T^2;
    elseif T > 400 && T <= 600
        psi = 8.62760 + 0.604808e-2 * T - 0.290763e-5 * T^2;
    elseif T > 600 && T <= 800
        psi = 9.22416 + 0.405170e-2 * T - 0.122842e-5 * T^2;
    elseif T > 800 && T <= 1000
        psi = 8.58266 + 0.484824e-2 * T + 0.398421e-5 * T^2 - 0.143229e-7 * T^3 + 0.129794e-10 * T^4 - 0.401566e-14 * T^5;
    elseif T > 1000 && T <= 1200
        psi = 9.53683 + 0.170452e-2 * T + 0.366499e-5 * T^2 - 0.412950e-8 * T^3 + 0.127907e-11 * T^4;
    elseif T > 1200 && T <= 1400
        psi = 0.107216e2 + 0.138168e-2 * T; 
    elseif T > 1400 && T <= 1600
        psi = 10.9430 + 0.122326e-2 * T;
    elseif T > 1600 && T <= 1800
        psi = 0.111446e2 + 0.109682e-2 * T; 
    elseif T > 1800 && T <= 2000
        psi = 11.6388 + 0.556243e-3 * T - 0.212128e-6 * T^2 + 0.407194e-9 * T^3 - 0.115408e-12 * T^4;
    else
        error('Temperature T = %.2f K is outside the valid range [200, 2000] K for psi(T).', T);
    end
end

function T = calculate_T_from_psi(psi)
% Calculates Temperature (T) as a function of psi (ψ).
% Assumed Units: psi(kJ/(kg*K)?), T(K)

    if psi >= 9.5266 && psi <= 10.5801 % Corresponds to T=200-400
        T = 670.501 - 0.906653e2 * psi + 0.689000 * psi^2 - 0.149014 * psi^3 - 0.806271e-2 * psi^4 + 0.670263e-2 * psi^5; 
    elseif psi > 10.5801 && psi <= 11.2112 % Corresponds to T=400-600
        T = -0.174713e4 + 0.540265e3 * psi - 0.495662e2 * psi^2 + 0.160424e1 * psi^3 - 0.162647 * psi^4 + 0.159732e-1 * psi^5;
    elseif psi > 11.2112 && psi <= 11.6786 % Corresponds to T=600-800
        T = 385.098 - 27.1561 * psi - 0.856323 * psi^2 + 0.384451 * psi^3 + 0.540119e-1 * psi^4;
    elseif psi > 11.6786 && psi <= 12.0567 % Corresponds to T=800-1000
        T = 0.546504e3 - 0.112885e3 * psi + 2.10339 * psi^2 - 0.426766 * psi^3 + 0.689971e-1 * psi^4 + 0.313236e-2 * psi^5; 
    elseif psi > 12.0567 && psi <= 12.3762 % Corresponds to T=1000-1200
        T = -0.745321e3 + 8.44630 * psi + 3.85637 * psi^2 - 0.275938 * psi^3 + 0.193037e-1 * psi^4 + 0.454304e-2 * psi^5;
    elseif psi > 12.3762 && psi <= 12.6532 % Corresponds to T=1200-1400
        T = 0.507538e3 - 0.164811e3 * psi + 4.81645 * psi^2 - 0.614818 * psi^3 + 0.134650 * psi^4; 
    elseif psi > 12.6532 && psi <= 12.8978 % Corresponds to T=1400-1600
        T = -0.179242e4 + 0.410215e3 * psi - 0.405127e2 * psi^2 + 0.973133e-1 * psi^3 + 0.167367 * psi^4; 
    elseif psi > 12.8978 && psi <= 13.1168 % Corresponds to T=1600-1800
        T = -0.179696e4 + 9.28861 * psi + 6.37976 * psi^2 - 0.197170 * psi^3 + 0.953193e-1 * psi^4; 
    elseif psi > 13.1168 && psi <= 13.3150 % Corresponds to T=1800-2000
        T = -0.203977e4 + 0.115391e3 * psi - 5.75607 * psi^2 + 0.479310 * psi^3 + 0.351744e-1 * psi^4 + 0.307252e-2 * psi^5;
    else
        error('Psi = %.4f is outside the valid range [9.5266, 13.3150] for T(psi).', psi);
    end
end

function theta_psi = calculate_theta_psi_from_T(T)
% Calculates property theta_psi as a function of Temperature (T).

    if T >= 200 && T <= 400
        theta_psi = -1.47781 + 0.430504e-2 * T ;
    elseif T > 400 && T <= 600
        theta_psi = -1.02794 + 0.171682e-2 * T + 0.244252e-5 * T^2 + 0.122026e-8 * T^3 - 0.301601e-10 * T^4 + 0.182767e-13 * T^5;
    elseif T > 600 && T <= 800
        theta_psi = -0.639169 + 0.110594e-2 * T + 0.433974e-5 * T^2 - 0.256925e-8 * T^3; 
    elseif T > 800 && T <= 1000
        theta_psi = -0.278105 + 0.104424e-2 * T + 0.281488e-5 * T^2 - 0.126703e-8 * T^3;
    elseif T > 1000 && T <= 1200
        theta_psi = -0.500646 + 0.246010e-2 * T + 0.544612e-6 * T^2 - 0.722395e-10 * T^3 - 0.117749e-12 * T^4; 
    elseif T > 1200 && T <= 1400
        theta_psi = -3.70926 + 0.102954e-1 * T - 0.719302e-5 * T^2 + 0.455854e-8 * T^3 - 0.233367e-11 * T^4 + 0.549519e-15 * T^5;
    elseif T > 1400 && T <= 1600
        theta_psi = 2.08561 - 0.739281e-3 * T + 0.360002e-6 * T^2 + 0.126361e-8 * T^3 - 0.479862e-12 * T^4;
    elseif T > 1600 && T <= 1800
        theta_psi = 3.54495 - 0.111809e-2 * T - 0.424724e-6 * T^2 + 0.906648e-9 * T^3 + 0.152313e-12 * T^4 - 0.145243e-15 * T^5;
    elseif T > 1800 && T <= 2000
        theta_psi = 1.52144 + 0.294055e-3 * T + 0.108648e-5 * T^2 - 0.217913e-9 * T^3;
    else
        error('Temperature T = %.2f K is outside the valid range [200, 2000] K for theta_psi(T).', T); 
    end
end


function theta_psi = calculate_theta_psi_from_psi(psi)
% Calculates property theta_psi as a function of psi (ψ).
% Assumed Units: psi(kJ/(kg*K)?), theta_psi(?)

    if psi >= 9.5266 && psi <= 10.5801 % Corresponds to T=200-400
        theta_psi = 1.73076 - 0.348899 * psi - 0.102553e-1 * psi^2 - 0.459574e-3 * psi^3 + 0.165776e-5 * psi^4 + 0.292430e-4 * psi^5; 
    elseif psi > 10.5801 && psi <= 11.2112 % Corresponds to T=400-600
        theta_psi = 0.636410 - 0.547156 * psi + 0.146361e-1 * psi^2 + 0.581828e-3 * psi^3 + 0.244896e-4 * psi^4;
    elseif psi > 11.2112 && psi <= 11.6786 % Corresponds to T=600-800
        theta_psi = -2.83880 - 0.994684e-1 * psi + 0.399196e-2 * psi^2 + 0.169708e-2 * psi^3 + 0.132314e-3 * psi^4; 
    elseif psi > 11.6786 && psi <= 12.0567 % Corresponds to T=800-1000
        theta_psi = -1.96259 - 0.171695 * psi + 0.187145e-2 * psi^2 + 0.147130e-2 * psi^3 + 0.165450e-3 * psi^4;
    elseif psi > 12.0567 && psi <= 12.3762 % Corresponds to T=1000-1200
        theta_psi = 2.65179 + 0.229667 * psi - 0.740343e-1 * psi^2 + 0.739380e-2 * psi^3;
    elseif psi > 12.3762 && psi <= 12.6532 % Corresponds to T=1200-1400
        theta_psi = 6.98557 + 0.193110 * psi + 0.148119e-1 * psi^2 + 0.273928e-2 * psi^3;
    elseif psi > 12.6532 && psi <= 12.8978 % Corresponds to T=1400-1600
        theta_psi = 4.23573 + 0.975009e-1 * psi + 0.177466e-1 * psi^2 - 0.811147e-3 * psi^3 + 0.152698e-3 * psi^4 + 0.391445e-5 * psi^5;
    elseif psi > 12.8978 && psi <= 13.1168 % Corresponds to T=1600-1800
        theta_psi = 4.54877 + 0.259705 * psi + 0.278893e-2 * psi^2 - 0.130202e-2 * psi^3 + 0.266877e-3 * psi^4;
    elseif psi > 13.1168 && psi <= 13.3150 % Corresponds to T=1800-2000
        theta_psi = 7.99462 + 0.592602 * psi - 0.325843e-1 * psi^2 + 0.448706e-2 * psi^3;
    else
        error('Psi = %.4f is outside the valid range [9.5266, 13.3150] for theta_psi(psi).', psi);
    end
end


% fprintf('For T = %.2f K:\n', T_test);
% fprintf('  cp = %.6f\n', cp_val);
% fprintf('  H  = %.4f\n', H_val);
% fprintf('  theta_s = %.6f\n', theta_s_val);
% fprintf('  theta_H(T) = %.4f\n', theta_H_T_val);
% fprintf('  psi = %.6f\n', psi_val);
% % fprintf('  theta_psi(T) = %.6f\n', theta_psi_T_val); % Uncomment if T>400
%
% fprintf('For H = %.2f kJ/kg:\n', H_test);
% fprintf('  T = %.4f K\n', T_from_H_val);
% fprintf('  theta_H(H) = %.4f\n', theta_H_H_val);
%
% fprintf('For psi = %.4f:\n', psi_test);
% fprintf('  T = %.4f K\n', T_from_psi_val);
% fprintf('  theta_psi(psi) = %.6f\n', theta_psi_psi_val);