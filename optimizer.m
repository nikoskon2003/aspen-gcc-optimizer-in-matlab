clear; clc; close all;
config;

format long;

addpath("./scripts/aspen")
addpath("./scripts/costs")
addpath("./scripts/optm")

disp("Opening aspen...")

aspen = AspenInstance();
aspen = aspen.StartBkp(sprintf("%s/%s.bkp", conf.aspen_dir, conf.filename), true);
aspen.SetVisibility(conf.aspen_visible);

disp("Aspen init...")
aspen.Aspen.Reinit();
aspen.TryRun(conf.ignore_run_errors);

global db
db = DBManager();
db = db.SetAspenInstance(aspen);


fprintf("Populating initial: streams");
db = db.PopulateAllStreams();
fprintf("/blocks ...\n");
db = db.PopulateAllBlocks();


% 'PlotFcns',@optimplotfval, 
options = optimset('TolFun', 10000, 'OutputFcn', @opt_fun_prt, 'TolX', 1e-2);
x = fminsearch(@opt_fun,opt_fun_init(), options)