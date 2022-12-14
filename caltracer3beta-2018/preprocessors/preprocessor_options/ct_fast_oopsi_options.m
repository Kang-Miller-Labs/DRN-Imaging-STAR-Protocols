function options  = ct_fast_oopsi_options
% Frame rate recieved from caltracer.
% options.V.dt.value = 30;		% frame rate.
% options.V.dt.prompt = 'Enter the framerate in Hz';
% options.V.dt.value = 1/options.V.dt.value;

options.Plam.value = 0.5;		
options.Plam.prompt = 'Enter the P.lam';


options.brpoints.value = 500;
options.brpoints.prompt= 'For linear detrend, enter the number of frames between breakpoints.';

options.smoothing.value=30;
options.smoothing.prompt= 'Enter the number of frames over which to average.';