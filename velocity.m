function [v1, v2, v3] = velocity(H, theta, D, ks, rho_s, rho_f)
    g = 9.81;
    R = (rho_s-rho_f)/rho_f;
    u = sqrt(g*H*sind(theta));
    tau = u.^2/R/g/D;
    v1 = 30.5*tau*sqrt(R*g*D)*(D/ks)^0.583;
    
    D50 = D;
    dummy = 0.407*log(142*tand(theta));
    % from Gimbert et al., 2014 implementation
    tau_c50 = exp(2.59 * (10^(-2)) * (dummy^4) + 8.94 * 10^(-2) * ...
        (dummy^3) + 0.142 * (dummy^2) + 0.41 * dummy - 3.14);
    % from Lamb et al., 2008
    % tau_c50 = 0.15*(tand(theta))^0.25;
    tau_c = tau_c50*(D/D50)^(-0.9); % critical shear stress
    
    v2 = 1.56*sqrt(R*g*D)*(tau/tau_c-1).^(0.56);

    v3 = 1.19*sqrt(R*g*D)*(tau/tau_c-1).^(0.3);
end
