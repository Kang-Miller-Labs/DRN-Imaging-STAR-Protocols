function options = ct_normalize_by_user_defined_options
options.startTime.value = 1;
options.stopTime.value = 2;

options.function.prompt = 'Enter the function used on data (min|max|mean|std).';
options.function.value = 'mean';

options.startTime.prompt = 'Enter the start time for the baseline period.';
options.stopTime.prompt = 'Enter the stop time for the baseline period.';