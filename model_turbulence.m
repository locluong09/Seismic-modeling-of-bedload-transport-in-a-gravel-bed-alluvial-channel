function PSD = model_turbulence(f, D, W, H, theta, r0, D50, Dstd, varargin)
% PSD estimate from turbulence of flowing water in river (Gimbert et
% al.,2014)


if ((nargin < 4)) || (isempty(H))
    H = 4;
end

if ((nargin < 5)) || (isempty(theta))
    theta = 1.4;
end

if ((nargin < 6)) || (isempty(r0))
    r0 = 600;
end

if ((nargin < 7)) || (isempty(D50))
    D50 = D;
end

if ((nargin < 8)) || (isempty(Dstd))
    Dstd = 0.52;
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


rho_s = 2700; % sediment density (kg/m3)
rho_f = 1000; % fluid density (kg/m3)
g = 9.81; % gravitational accelaration (m2/s)


% Retrieving parameters from varargin
optionals = {};
numInputs = nargin - 8;
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

%% Turbulent model
ks = 3*D50;
K = 0.5;
C = 0.5;
X1r = ks/2;

N11 = 0.6;
N12 = 0.8;

alpha1 = 0.12; % from Lamb et al., 2008
alpha2 = 0.2;

s = Dstd/(sqrt(1/3 - 2/pi()^2));
p = ((1/(2*s))*(1 + cos(pi*((log(D)-log(D50))./s))))./D;

% shear velocity u
u = sqrt(g*H*sind(theta));

% from Lamb et al 2008 eq20; Gimbert et al 2014 eq8
cu_X1r = (X1r/(alpha1*ks))*(1-X1r/(2*ks)*ks/H); 
cu_ks = (ks/(alpha1*ks))*(1-ks/(2*ks)*ks/H);
c_sigma = alpha2*(5.62*log10(H/ks)+4); 

zeta_Hks = (cu_ks^(1/3)*cu_X1r^(4/3)*c_sigma^(2/3))^2; % Eq. (33)

u2_X1r = cu_X1r*u;

fc = u2_X1r./D; 
ki_fl = 1./(1+((2.*f./fc).^(4/3)));

% phiD is modulation of the predicted ground velocity PSD by grain sizes
phiD = trapz(D,p.*(D.^2).*ki_fl.^2); 

PSD = (N11^2+N12^2)*(K*W/3/ks^(2/3))*(rho_f/rho_s)^2*...
(1+epsilon)^2/(f0^(5*epsilon)*vc0^5)*...
zeta_Hks*chi.*phiD.*f.^(4/3+5*epsilon)*C^2*u^(14/3);

end