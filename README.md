# MDFconnect_example

The repo shows implemetation examples for [MDFconnect](https://github.com/Arne-Voigt/MDFconnect) repo.

## write mdf file

exports simulation data into the testWrite.mdf file, run: 
```
writeMdf()
```
this will: 
* run the simulink model generate_timeseries.slx
* gather the data from the logged, streamed and data store signals
* export the signals into the testWrite.mdf file

## read mdf file 

imports data from testWrite.mdf file into the matlab workspace, run:
```
readMdf()
```

## read mdf file with signal parser

imports data from testWrite.mdf file into the matlab workspace, run:
```
readMdf_withNameParser()
```
this will:
* the change the imported signals, as defined in the signalNameParser() function, idea for this is to have a 
custom way from tweaking the signal name (e.g. for removing the "/ETK" substring )
