% Main Script for 2D FEM WG + Antenna
clc;
clear;

% Load and Prepare given Mesh |-> x, y, emt_nodes/dom, b_nodes, b_edges
load_data;

% Parameter Definitions
% *************************************************************************
d = 0.02; % Length of WG in y-direction - Probably not needed
k = pi/d; % ToDo: First Dominant Even Mode?
eps_0 = 8.85e-12; % Permittivity of Free Space
eps_air = 1.; % Permittivity of Air
mu_wg = 12.56e-7; % Permeability of WG - ToDo WG and other Parts?
mu_0 = (4*pi)*10^(-7); % Permeability of Free Space
% ToDo Size of figures
% *************************************************************************

% Find Boundaries of the given Mesh |-> x_min = min(x_nodes) etc.
[x_min, y_min, y_max, x_max] = find_boundaries(N_n, x, y);

% ToDo - Exclude Nodes between different materials from the set of b_nodes?

figure('Color', [1,1,1]);
set_figure_1; % Axis + Hold on etc.
geometry_plot; % Plots the Geometry - Boundary Edges

figure('Color', [1,1,1]);
set_figure_1; % Axis + Hold on etc.
mesh_plot_with_boundary_nodes; % Plots Mesh and Boundary Nodes
axis on;

% ToDo Matrix Assembly