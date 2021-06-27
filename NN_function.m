function [y1] = myNeuralNetworkFunction(x1)
%MYNEURALNETWORKFUNCTION neural network simulation function.
%
% Auto-generated by MATLAB, 27-Jun-2021 02:44:23.
%
% [y1] = myNeuralNetworkFunction(x1) takes these arguments:
%   x = Qx5 matrix, input #1
% and returns:
%   y = Qx2 matrix, output #1
% where Q is the number of samples.

%#ok<*RPMT0>

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1.xoffset = [31661;0.18;20.53;69;0.15];
x1_step1.gain = [2.77400205276152e-05;40;0.0143636885952313;0.025;15.3846153846154];
x1_step1.ymin = -1;

% Layer 1
b1 = [-0.0098758601133464296584;0.01007770148125940006;-0.012975299630324017841;-0.013234666917390289567;0.012312941784442147514;0.013378607841403088521;-0.012444869782407753933;-0.013512709585135387544;-0.013703758075490353463;-0.0016714076411146309726];
IW1_1 = [0.046781773153016514843 0.098872382603429689873 0.10001713031944410581 0.012401785967267474689 0.045659707750406793025;-0.046769429201904348659 -0.098938413015567466813 -0.10008835345107019998 -0.012336587394126304063 -0.045644981863911388009;0.047769082344602309398 0.10212901980783231637 0.10337967790002981772 0.011873127523999906646 0.04658693224855083026;0.047444480599764068951 0.10162166048198924273 0.10287229541307123248 0.011667849355537582984 0.046265469019557463326;-0.050014006948368529282 -0.10612419275577085476 -0.10740623007078593798 -0.012965183202157242251 -0.048795571492008610326;-0.04941339740400184366 -0.10543404588014190781 -0.106732268844340214 -0.012417771932660285131 -0.048193261912460941265;0.049438875769221006518 0.10508547549184503456 0.10635839948062683624 0.012695671464924689412 0.048230211475278700339;0.049661243325756394829 0.1059614908185013693 0.10726897148059474918 0.012480070259104837638 0.048434462781949662313;0.047848439939383327624 0.10259536122967453931 0.10386780787693637718 0.011692759370594702981 0.046655298547163895351;-0.0094989952587206105683 -0.018359372808946512745 -0.018495904206563176797 -0.0036700146513003145503 -0.0093197677888565456927];

% Layer 2
b2 = [7.635337689695019126e-07;0.066375566382644440866];
LW2_1 = [0.00010252265737237141387 -0.00010299118203995081199 0.0001088793574123756683 0.00010953848903150122801 -0.00010669077809223263657 -0.00010906137838593118116 0.00010716355595480899453 0.00010923562560493251634 0.00011031873567570137085 -1.8809492714241384599e-05;0.16162645091262636821 -0.16235088090299262809 0.17179274036416461446 0.17271788899708376275 -0.1690670079462875397 -0.17259021005917199454 0.16962949442778957332 0.17294193132330293317 0.17405677537515518161 -0.029329944984332455976];

% Output 1
y1_step1.ymin = -1;
y1_step1.gain = [366.122803272083;2.72858812496989];
y1_step1.xoffset = [0.00265735323453689;4.47809987431465];

% ===== SIMULATION ========

% Dimensions
Q = size(x1,1); % samples

% Input 1
x1 = x1';
xp1 = mapminmax_apply(x1,x1_step1);

% Layer 1
a1 = tansig_apply(repmat(b1,1,Q) + IW1_1*xp1);

% Layer 2
a2 = repmat(b2,1,Q) + LW2_1*a1;

% Output 1
y1 = mapminmax_reverse(a2,y1_step1);
y1 = y1';
end

% ===== MODULE FUNCTIONS ========

% Map Minimum and Maximum Input Processing Function
function y = mapminmax_apply(x,settings)
y = bsxfun(@minus,x,settings.xoffset);
y = bsxfun(@times,y,settings.gain);
y = bsxfun(@plus,y,settings.ymin);
end

% Sigmoid Symmetric Transfer Function
function a = tansig_apply(n,~)
a = 2 ./ (1 + exp(-2*n)) - 1;
end

% Map Minimum and Maximum Output Reverse-Processing Function
function x = mapminmax_reverse(y,settings)
x = bsxfun(@minus,y,settings.ymin);
x = bsxfun(@rdivide,x,settings.gain);
x = bsxfun(@plus,x,settings.xoffset);
end
