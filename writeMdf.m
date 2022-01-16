%% add MDFconnect folder to the matlab path 
[thisPath,~] = fileparts(mfilename('fullpath'));
addpath(fullfile(thisPath, 'MDFconnect'));

%% run simultion
open('generate_timeseries.slx');
sim('generate_timeseries.slx');
bdclose('generate_timeseries.slx');

%% collect sim-data 
simDataBucket = tsBucket();

% add sim-data 
simDataBucket.add(logsout);     % logged signals
simDataBucket.add(dsmout);      % data storage
simDataBucket.add(streamout);   % streamed sginals

% generate timeseries manually and add to the bucket 
gtZero_logical_40ms = streamout.get('sine_40ms').Values;
gtZero_logical_40ms.Name = 'gtZero_logical_40ms';
gtZero_logical_40ms.Data = gtZero_logical_40ms.Data>0;
simDataBucket.add(gtZero_logical_40ms);
simDataBucket.pack(); % find common timebases -> reduces mdf-file size 

%% write sim data into mdf 
tic

MdfObjWrite = MDF_OBJECT();
MdfObjWrite.importTsBucket(simDataBucket); 
MdfObjWrite.print('testWrite.mdf');

fprintf('time to write file: %.2fsec\n',toc);