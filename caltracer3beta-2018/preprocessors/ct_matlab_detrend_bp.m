function x = ct_matlab_detrend_bp(x, options)
[nrecordings len] = size(x);
% Detrends both contours and halos using MATLAB's built-in detrend function.
% MD - Created on 4/9/2010

time_res = options.timeRes.value;
start_idx = ceil(options.startTime.value/time_res);
stop_idx = floor(options.stopTime.value/time_res);




if (start_idx < 1 | start_idx > len)
    start_idx = 1;
end
if (stop_idx < 1 | stop_idx > len)
    stop_idx = len;
end

xnew = x(:,start_idx:stop_idx);
bp=(start_idx:120/time_res:stop_idx);
bp(1)=[];
for i = 1:nrecordings
xnew(i,:) = detrend(xnew(i,:),'linear',bp);
end
x = xnew;
