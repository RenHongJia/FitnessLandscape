function OUTPUT = runTestOldFunctions(func, my_D)

% I_NP            number of population members
		I_NP = 150;  %pretty high number - needed for demo purposes only

% I_itermax       maximum number of iterations (generations)
		I_itermax = 1001; 
       
% F_weight        DE-stepsize F_weight ex [0, 2]
		F_weight = 0.5; 

% F_CR            crossover probabililty constant ex [0, 1]
		F_CR = 0.8; 

% I_strategy     1 --> DE/rand/1:
%                      the classical version of DE.
%                2 --> DE/local-to-best/1:
%                      a version which has been used by quite a number
%                      of scientists. Attempts a balance between robustness
%                      and fast convergence.
%                3 --> DE/best/1 with jitter:
%                      taylored for small population sizes and fast convergence.
%                      Dimensionality should not be too high.
%                4 --> DE/rand/1 with per-vector-dither:
%                      Classical DE with dither to become even more robust.
%                5 --> DE/rand/1 with per-generation-dither:
%                      Classical DE with dither to become even more robust.
%                      Choosing F_weight = 0.3 is a good start here.
%                6 --> DE/rand/1 either-or-algorithm:
%                      Alternates between differential mutation and three-point-
%                      recombination.           

		I_strategy = 1;

% I_refresh     intermediate output will be produced after "I_refresh"
%               iterations. No intermediate output will be produced
%               if I_refresh is < 1
      I_refresh = 100; 

% I_plotting    Will use plotting if set to 1. Will skip plotting otherwise.
      I_plotting = 0;
% I_D		number of parameters of the objective function 
    I_D = my_D; 

% Fes max run
    I_Fes = 9999999999

    global S_struct;
    S_struct.I_NP         = I_NP;
    S_struct.F_weight     = F_weight;
    S_struct.F_CR         = F_CR;
    S_struct.I_D          = I_D;
    S_struct.I_itermax    = I_itermax;
    S_struct.I_strategy   = I_strategy;
    S_struct.I_refresh    = I_refresh;
    S_struct.I_plotting   = I_plotting;
    
    S_struct.I_Fes = I_Fes;
    
    %% setting test function
    S_struct.TestFunctionType  = 'normal';
    S_struct.func_num = 0;
    funcParameter = [func 'Parameter'];
    feval(funcParameter);

% S_struct.FVr_minbound = FVr_minbound;
% S_struct.FVr_maxbound = FVr_maxbound;
% S_struct.I_bnd_constr = I_bnd_constr;
% S_struct.F_VTR        = F_VTR;

%********************************************************************
% Start of optimization
%********************************************************************
AnalyzeProblem(S_struct,func);

[FVr_x,S_y,I_nf,OUTPUT] = deopt(func,S_struct);
a =1;

end