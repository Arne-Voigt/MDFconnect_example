% reads the signals from the testWrite.mdf file into the workspace
% uses the function signalNameParser() to tweak the signal name before assigning it to the workspace 

%% add MDFconnect folder to the matlab path 
[thisPath,~] = fileparts(mfilename('fullpath'));
addpath(fullfile(thisPath, 'MDFconnect'));

%% generate the mdf-file if it doesn't exist
if (~exist (fullfile(thisPath,'testWrite.mdf'), 'file'))
    writeMdf();
end

%% read in file structure
tic
MdfObjRead = MDF_OBJECT(@signalNameParser);  
MdfObjRead.read('testWrite.mdf');
fprintf('time to read file:  %.2fsec\n',toc);

%% extract data via container  
tic
cntnr = MdfObjRead.hHD.getContainerOfAllCNsRegEx('.*'); % use regex to filter for desired channels
for key = cntnr.keys()  % step through all channles
    sigData = cntnr(key{1}).getDataAsTimeseries();  % extract-data function on the channel
    if ~isempty(sigData)
        assignin('base', sigData.Name, sigData);    % assign signal to workspace
    end
end
fprintf('time to extract signals: %.2fsec\n',toc);
