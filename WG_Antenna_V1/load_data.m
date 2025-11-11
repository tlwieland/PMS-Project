% Loads and Prepares given Data

clc;
clear;

load nodes.txt;
load elements.txt;
load domains.txt;
load bcs.txt;

[N_n var] = size(nodes); % Number of Nodes
[N_e var] = size(elements); % Number of Elements
[N_b var] = size(bcs); % Number of Boundary Edges
clear var;

% Initialize Vectors for Node Coordinates
for i=1:N_n
    x(i) = nodes(i,1); % X-Coordinates of Nodes
    y(i) = nodes(i,2); % Y-Coordinates of Nodes
end

% Initialize Matrix for Element Nodes and Element Domain
for i=1:N_e
    for j=1:3
        emt_nodes(i,j) = elements(i,j) + 1; % CPP |-> Linalg Indexing
    end
    emt_dom(i) = domains(i); % Domain of Element
end

% Initialize Matrix for Boundary Edges
for i=1:N_b
    b_edge(i,1) = bcs(i,1) + 1; % CPP |-> Linalg Indexing
    b_edge(i,2) = bcs(i,2) + 1; % CPP |-> Linalg Indexing
    
    in = bcs(i,1) + 1; % CPP |-> Linalg Indexing
    b_node(in) = 1; % True if Node is a Boundary Node, False otherwise

    in = bcs(i,2) + 1; % CPP |-> Linalg Indexing
    b_node(in) = 1; % True if Node is a Boundary Node, False otherwise
end

