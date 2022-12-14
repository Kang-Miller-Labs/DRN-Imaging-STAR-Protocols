function x = ct_normalize_by_user_defined(x, options)

[nrecordings len] = size(x);

% Assume mean for now.

time_res = options.timeRes.value;
start_idx = ceil(options.startTime.value/time_res);
stop_idx = floor(options.stopTime.value/time_res);

% BP
if (start_idx < 1)
    start_idx = 1;
    %warndlg('Starting index less than one. Please readsjust settings.');
end
if (stop_idx > len)
    stop_idx = len;
    %warndlg('Stop index is less than one. Please readjust settings.');
end

for i = 1:nrecordings
    switch options.function.value
     case {'min', 'MIN'}
      norm_factor = min(x(i,start_idx:stop_idx));
      1;           
     case {'mean', 'MEAN'}
      norm_factor = mean(x(i,start_idx:stop_idx));
      1;
     case {'max', 'MAX'}
      norm_factor = max(x(i,start_idx:stop_idx));
      1;
     case {'std', 'STD'}
      norm_factor = std(x(i,start_idx:stop_idx));
      1;
     otherwise
      warningdlg('Couldn''t understand function.  Using the mean.');
      norm_factor = mean(x(i,start_idx:stop_idx));
    end
    norm_factor = norm_factor(1);
    x(i,:) = x(i,:) / norm_factor;
end




