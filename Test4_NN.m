clear all

filename = 'Training_data.mat';
load(filename);

WP_Mean = Training_data.WP_Mean;
WP_Std = Training_data.WP_Std;
TKE_near_bed = Training_data.TKE_near_bed;
TKE_flow = Training_data.TKE_flow;
TKE_near_surface = Training_data.TKE_near_surface;


Re = [31661; 44012; 62451; 81266; 103759;]; %12508 for 49mm
Froude = [0.18; 0.18; 0.20; 0.21; 0.23;];
Weber = [20.53; 34.74; 64.05; 102.14; 159.77;];
Depth = [69; 89; 109; 129; 149;];
Velocity = [0.15; 0.17; 0.21; 0.24; 0.28;];

Training = [Re Froude Weber Depth Velocity];

TKE = [TKE_near_bed TKE_flow TKE_near_surface];


