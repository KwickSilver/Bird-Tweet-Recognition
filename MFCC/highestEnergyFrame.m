function mfcc1 = highestEnergyFrame(mfcc)

	[m,n] = size(mfcc);
	new_n = 100;
	vector = zeros(n,2);
	mfcc1 = zeros(m,new_n);
	for i = 1:n,
		vector(i,1) = power(sum(mfcc(:,i).^2)/m,1/2);
		vector(i,2) = i;
	end;
	sort(vector);
	if(n<new_n),
		new_n=n;
	end;
	for i = 1:new_n,
		mfcc1(:,i) = mfcc(:,vector(i,2));
	end;
	
end;