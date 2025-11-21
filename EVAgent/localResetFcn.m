function in = localResetFcn(in)
% This function randomizes the environment for EV SOC optimization training.
% It is called at the beginning of each training episode.

% --- Define your model name once at the top for easy editing ---
mdl = 'ev_control'; 

fprintf('---------------------------------------------------\n');
fprintf('Starting new episode. Randomizing conditions...\n');

gain_block = [mdl '/Random Cycle Gain'];

% Define the range for the random divisor
min_divisor = 2.5;
max_divisor = 3.5;
random_divisor = min_divisor + (max_divisor - min_divisor) * rand();

% The Gain block performs multiplication, so its value is 1/divisor
gain_value = 1 / random_divisor;

% Set the 'Gain' parameter of the block using the standard name
set_param(gain_block, 'Gain', num2str(gain_value));
fprintf('Drive cycle gain randomized to: %.4f (Divisor: %.4f).\n', gain_value, random_divisor);

% =================================================================
% Part 3: Randomize Initial Battery SOC
% =================================================================
% Define a range for the random initial SOC (e.g., 60% to 90%)
min_soc = 70;
max_soc = 90;
initial_soc = min_soc + (max_soc - min_soc) * rand();

% Set the initial SOC of the 'Battery1' block
battery_block = [mdl '/Battery1'];
% IMPORTANT: The parameter name for initial SOC is often 'SOC_o' or 'InitialSOC'.
% You MUST verify the correct name for your specific block (see below).
soc_param_name = 'SOC'; % <-- VERIFY THIS PARAMETER NAME

set_param(battery_block, soc_param_name, num2str(initial_soc));
fprintf('Battery initial SOC randomized to: %.2f %%.\n', initial_soc);
fprintf('---------------------------------------------------\n');

end