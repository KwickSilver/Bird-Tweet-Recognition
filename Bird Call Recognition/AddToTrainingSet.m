function AddToTrainingSet(folder,res)

	BirdWavePath = folder;
	BirdSoundData = dir(BirdWavePath);
	BirdsWaveFiles = {BirdSoundData.name};
	
	new_n = 100;
	Data = zeros(1,13,new_n);
	Result = ['a'];
	
	for j = 3:size(BirdsWaveFiles,2),
		waveFile = strcat(BirdWavePath,'\',BirdsWaveFiles{j});
		[y fs opt] = wavread(waveFile);
		opt = mfccOptSet(fs);
		[mfcc yPreEmp] = wave2mfcc(y,fs,opt);
		temp(1,:,:) = highestEnergyFrame(mfcc);
		Data = [Data ; temp];
		Result = [Result;res];
	end;
	
	features = load('C:\Users\shantanu\Desktop\MinorProject\Code\DATA\train.dat').features;
	result = load('C:\Users\shantanu\Desktop\MinorProject\Code\DATA\train_output.dat').result;
	
	features = [features ; Data(2:end,:,:)];
	result = [result ; Result(2:end)];
	BirdMapping({res});
	save('C:\Users\shantanu\Desktop\MinorProject\Code\DATA\train.dat','features');
	save('C:\Users\shantanu\Desktop\MinorProject\Code\DATA\train_output.dat','result');
	
end;