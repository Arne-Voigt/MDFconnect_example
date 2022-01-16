function nameReformat = signalNameParser( nameRaw )
    % use this function to tweak the mdf-signal name, e.g. remove "/ETK" extensions from the name
    % input  -> signal name string from the file
    % output -> tweaked signal name
    
    name = deblank(nameRaw); % remove spaces

    nameReformat = strtok(name,'\');                % remove everything past the '\'
    nameReformat = strtok(nameReformat,'/');    
    nameReformat = strrep(nameReformat,':','_');    % replace ':' with '_'
    nameReformat = strrep(nameReformat,'.','_');
    nameReformat = strrep(nameReformat,'[','_');
    nameReformat = strrep(nameReformat,']','_');

    % delete the time substrings (e.g. "_10ms") in the signal names, 
    % some signals get overwritten/lost due to them having the same name
    nameReformat = regexprep(nameReformat, '_[0-9]+ms', '');
    
end

