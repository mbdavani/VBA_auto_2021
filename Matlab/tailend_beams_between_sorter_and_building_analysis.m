clear all;
clc;
grating_lb_per_sq_ft = 8.87;
grating_lb_per_sq_in = grating_lb_per_sq_ft/144;
load_requirement_per_sq_ft = 40;
load_requirement_per_sq_in = load_requirement_per_sq_ft/144;

grating_width = 198.5;
grating_length = 365.25;
beam_width = 6.49;

beam_and_handrail_weight = 4261.3;
grating_weight = (grating_width*grating_length)*(grating_lb_per_sq_in +...
    load_requirement_per_sq_in);

w = -1/4 * (beam_and_handrail_weight + grating_weight) / beam_width;

SFBM('Tail End Catwalk - Beam to Customer Column',[216.375,0,216.375],...
    {'DF',w,[24.7,31.19]},{'DF',w,[197.46,203.95]});