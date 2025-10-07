% fourier series
%     Use the synthesis equation and a string for the ak to create a time
%     signal.
%     The synthesis equation for exponential Fourier Series is
%        y = Sum{a_k*exp(j*k*w0*t), k=-inf..inf} 
%
% SYNTAX:
%     y = fourier_series(ak_fcn_string,a0,w0,k,t)
% INPUTS:
%     ak_fcn_string   a string that contains the formula for the ak Fourier
%                     Series coefficients
%     a0              a numerical value for a0
%     w0              a numerical value for omega0, the fundamental
%                     frequency
%     k               a list of k values to be used in the synthesis
%                     equation. The ak string is evaluated at these values.
%                     If k=0 is not included a0 is treated as 0. 
%     t               the time array to be used.
% Usage Example:
%     t = -2:0.01:4;
%     y = fourier_series('(-j*2*1.5/(k*pi))*sin(k*pi/2).^2',0,pi,-55:55,t);
%     plot(t,y)
% Alternate Syntax:
%     [y,ak] = fourier_series(ak_fcn_string,a0,w0,k_arr,t)
% 	ak = the fourier series coefficients corresponding to the ak string at
% 	     the k values specified. 

function [y,ak] = fourier_series(ak_fcn_string,a0,w0,k_arr,t)

% Create and fill ak array
a = zeros(size(k_arr));
for kk=1:length(k_arr),
    k = k_arr(kk);
    if k==0,
        a(kk) = a0;
    else
        eval(['a(kk) = ' ak_fcn_string ';']);
    end
    if abs(a(kk))<0.00000001; a(kk)=0;end
end

% Synthesis equation
k = k_arr(1);
y = a(1)*exp(j*k*w0*t);
for kk=2:length(k_arr), 
   k = k_arr(kk);
   y = y + a(kk)*exp(j*k*w0*t); 
end

% account for roundoff errors
y(imag(y)<0.00000001)=real(y(imag(y)<0.00000001));

if nargout>=2,
    ak=a;
end