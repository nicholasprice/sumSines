% sumSines
% Quick'n'Dirty visualisation of pursuit target moving based on independent
% sum-of-sinusoids applied to horizontal and vertical positions
% see https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0012574
%
% NP 6 Jul 2021

disp('Press Ctrl-C to abort')

tStep = 1/60; % display update rate
tMax = 4.5; % s - period of fundamental frequency
t = 1:1/freq:tMax;


%% Sinusoidal parameters (frequency / amplitude / phase)
xFreq = [1/tMax 2/tMax 3/tMax];
xAmp = [1 1 1];
xPh = [0 0 0];
yFreq = xFreq;
yAmp = [1 1 1];
yPh = [0 pi/4 pi/3];
nSin = length(xFreq);



x = zeros(size(t));
y = zeros(size(t));
for a = 1:nSin
    x = x + xAmp(a) * sin(2*pi*t*xFreq(a) + xPh(a));
    y = y + yAmp(a) * sin(2*pi*t*yFreq(a) + yPh(a));    
end

figure
ind = 1;
while 1
    ind = mod(ind+1, length(t)); if ind==0, ind = length(t); end
    plot(x(ind), y(ind),'ko','markerfacecolor','k')
    axis([-3 3 -3 3])
    pause(0.01)
end