% 2D FEM analysis of the waveguide discontinuities 

% Load ASCII data: mesh, boundary nodes, domains (COMSOL is used as a mesh
% generator)
load_data;

% Parameters definition
% **************************************************************
d=0.02;                     % Distance of the waveguide plates 
f=10e9;                     % Frequency
Order=0;                    % Order of the even mode
eps1=1.;                    % Permittivity of the input branch of the waveguide
eps2=4.;                    % Permittivity of the waveguide discontinuity    
eps3=1.;                    % Permittivity of the output branch of the waveguide
imj=sqrt(-1);
mu0=4*pi*1.e-7;             % Mag. permeability of vacuum
eps0=8.85e-12;              % Diel. permittivity of vacuum
c=1/sqrt(mu0*eps0);
omega=2*pi*f;               % Angular frequency
k0=omega*sqrt(mu0*eps0);    % Free space wave-vector
ky=(2*Order+1)*pi/d;        % Even modes
kx=sqrt(k0^2-ky^2);         % Guiding mode propagation constant
% E0=1.;                                % Amplitude of the input signal
E0=sqrt(2)*sqrt(2*omega*mu0/(kx*d));    % Normalized input signal:Pin=1
solver=1;                   % 1 - sparse matrix solver; 2 - GMRES iterative solver
% *************************************************************************

[x_min_bc,y_min_bc,y_max_bc,x_max_bc]=find_boundaries(Nn,x_no,y_no);

boundary_nodes;             % This function excludes the nodes between two different materials from the set of boundary nodes

figure(1);
set_figure_1;
mesh_plot;
bcs_plot;
axis on;

asm_matrix_wp;  % Matrix assembly

def_ports;      % Ports definition

def_bcs;        % Definition of the PEC boundary conditions

switch solver
            % ***************************
    case 1  % direct sparse matrix solver
            % ***************************
        spparms('autoamd',0);
        permut=colamd(A); % Matrix reordering (bandwidth reduction)
        Vp = A (permut,permut) \ b(permut); % Direct solution
        Vc(permut)=Vp; % Mapping to the original numbering 
            % **********************
    case 2  % GMRES iterative solver
            % **********************
        M1=sparse(Nn,Nn);
        M=diag(A);
        for p=1:Nn
           M1(p,p)=M(p); 
        end
        [Vc,flag,relres,iter]=gmres(A,b,[],1e-7,Nn,M1);
end

Ez=Vc; % Electric field

figure(2);
V=real(Vc);
set_figure_1;
find_min_max;
field_plot;
geometry_plot;
title('Real part of Ez (V/m)');

% Magnetic field somputation: Hx, Hy
magnetic_field;
figure(3);
set_figure_1;
field_plot;
geometry_plot;
quiver(x_no,y_no,real(Hx),real(Hy),1,'k');

% Poynting vector
Poynting_field;
figure(4);
set_figure_1;
V=abs(Smod);
Vc=Smod;
find_min_max;
min_field=0;
field_plot;
geometry_plot;

% Sparameters
S11_input;
S21_output;

return;
