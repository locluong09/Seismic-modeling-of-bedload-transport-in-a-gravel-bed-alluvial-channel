function [PSD] = model_u(f, D, H, u, qb, W, theta, r0, t, varargin)
% Estimate PSD based on stochastic mechanism sediment transport

% f is frequency
% D is grain diameter
% H is flow depth
% qb is bedload flux
% W is river width
% theta is slope
% r0 is source station distance
% ks is roughness
% Sf is friction slope

if ((nargin < 5)) || (isempty(qb))
    qb = 1e-3;
end

if ((nargin < 6)) || (isempty(W))
    W = 50;
end

if ((nargin < 7)) || (isempty(theta))
    theta = 1.4;
end

if ((nargin < 8)) || (isempty(r0))
    r0 = 600;
end

if ((nargin < 9)) || (isempty(t))
    t = 0.15;
end


%% Default parameters from Tsai et al., 2012
v0 = 2206; %m/s
z0 = 1000; %m
f0 = 1; %Hz
Q0 = 20;
a = 0.272;
eta = 0;
epsilon = a/(1-a);
vc0 = (v0*gamma(1+a)/(2*pi*z0*f0)^a)^(1/(1-a));


% Retrieving parameters from varargin
optionals = {};
numInputs = nargin - 9;
inputVar = 1;

while numInputs > 0
    if ~isempty(varargin{inputVar})
        optionals{inputVar} = varargin{inputVar};
    end
    numInputs = numInputs - 1;
    inputVar = inputVar + 1;
end

len = length(optionals);
if len > 0
    vc0 = optionals{1};
    epsilon = optionals{2};
    Q0 = optionals{3};
    eta = optionals{4};
end

%% Seismic model
vc = vc0*(f./f0).^(-epsilon); % phase velocity
vu = vc./(1+epsilon); % group velocity
% Q = Q0*(f./f0).^eta; % quality factor

%% Attenuation of seismic wave (chi is a function of beta)
beta = 2*pi*r0*(1+epsilon)*f.^(1+epsilon-eta)./(vc0*Q0*f0^(epsilon-eta));
chi = 2*log(1+1./beta).*exp(-2*beta)+(1-exp(-beta)).*exp(-beta).*sqrt(2*pi./beta);



% Fluid and grain properties
rho_s = 2650; % solid density (kg/m3)
rho_f = 1000; % fluid density (kg/m3)
% Fluvial properties
Vp = pi*D^3/6; % volume of particle (m3)
m = rho_s*Vp; % particle weight (kg)

ks = 0.2; % roughness
ds = D; % grain size
Rh = (W*H)/(W+2*H); % hydraulic radius
Sf = 0.015; % surface water slope

phi = 90; % source-station azimuth
eb = 0.5; % controlling factor (0: fully inelastic impact, 1: fully elastic impact)

% [u] = rolling_velocity(H, theta, ks, ds, Rh, Sf, rho_s, rho_f);
% if u > 2
%     u = 2;
% end

% u = 1;
s = u * t;
rate = W*qb/Vp/s; % impact rate

fx = 0.146;
fy = 0.146;
fz = 0.539;

Ix = fx*(1+eb)*u;
Iy = fy*(1+eb)*u;
Iz = fz*(1+eb)*u;

Nzz = 0.6;
Nxz = 0.8*cosd(phi);
Nyz = 0.8*sind(phi);

% I = (Ix*Nxz)^2 + (Iy*Nyz)^2 + (Iz*Nzz)^2;
I = (abs(Ix*Nxz) + abs(Iy*Nyz) + abs(Iz*Nzz))^2;

PSD = rate*(m^2*pi^2*I)/rho_s^2/4*f.^3./vc.^3./vu.^2.*chi;

end
