function [features Result BirdsDirs] = featuresExtract(folder)

	new_n = 100;
	Data = zeros(1,13,new_n);
	Result = ['a'];
	temp = zeros(1,13,new_n);
	BirdPath = folder;
	BirdDirData = dir(BirdPath);
	BirdsDirs = {BirdDirData.name};
	
	for i = 3:size(BirdsDirs,2),
		BirdWavePath = strcat(BirdPath,'\',BirdsDirs{i});
		BirdSoundData = dir(BirdWavePath);
		BirdsWaveFiles = {BirdSoundData.name};
		for j = 3:size(BirdsWaveFiles,2),
			waveFile = strcat(BirdWavePath,'\',BirdsWaveFiles{j});
			[y fs opt] = wavread(waveFile);
			opt = mfccOptSet(fs);
			[mfcc yPreEmp] = wave2mfcc(y,fs,opt);
			temp(1,:,:) = highestEnergyFrame(mfcc);
			Data = [Data ; temp];
			Result = [Result;BirdsDirs{i}];
		end;
	end;
	features = Data(2:end,:,:);
	Result = Result(2:end,:);
end;