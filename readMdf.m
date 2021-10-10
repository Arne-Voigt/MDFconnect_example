tic
MdfObjRead = MDF_OBJECT();
MdfObjRead.read('testWrite.mdf');
toc

%% 1st version: extract data via dataBucket-object
% tic 
% dataBucket = MdfObjRead.hHD.getDataAsTsBucket();
% dataBucket.extractAll();  % extract all into the workspace
% toc

%% 2nd version: extract data via conatainer  
tic
cntnr = MdfObjRead.hHD.getContainerOfAllCNsRegEx('.*'); % use regex to filter for desired channels
for key = cntnr.keys() % step through all channles
    sigData = cntnr(key{1}).getDataAsTimeseries(); % extract-data function on the channel
    if ~isempty(sigData)
        assignin('base', sigData.Name, sigData);
    end
end
toc
