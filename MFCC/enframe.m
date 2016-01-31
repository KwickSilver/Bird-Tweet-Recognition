function out = enframe(y, frameSize, overlap)

if nargin<1, selfdemo; return; end
if nargin<3, overlap=0; end
if nargin<2, frameSize=256; end

y = y(:);
step = frameSize-overlap;
frameCount = floor((length(y)-overlap)/step);

out = zeros(frameSize, frameCount);
for i=1:frameCount,
	startIndex = (i-1)*step+1;
	out(:, i) = y(startIndex:(startIndex+frameSize-1));
end

% ====== Self demo
function selfdemo
mObj=mFileParse(which(mfilename));
strEval(mObj.example);
