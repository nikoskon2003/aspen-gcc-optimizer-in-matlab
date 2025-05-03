global conf

conf.filename = "OLA_v19";
conf.aspen_dir = "aspen";
conf.aspen_visible = 1;
conf.pause_before_exit = true;
conf.ignore_run_errors = true;

conf.split_stream = true;
conf.max_split_exchangers = 5;
conf.heat_duty_eps = 1;

conf.export_nonsplit_streams = true;

conf.enviroment_temp_in_oC = 25;
conf.ignore_outlets = false;
conf.outlet_cooling_threshold_oC = 40;