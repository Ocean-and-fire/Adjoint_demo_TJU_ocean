function [] = setPath

    base_path   = pwd;
    MODEL_folder  = fullfile(base_path, 'MODEL');
    addpath(genpath(MODEL_folder))

    TOOL_folder  = fullfile(base_path, 'TOOL');
    addpath(genpath(TOOL_folder))
   
end