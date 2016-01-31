function predicted_label = PredictBird(BirdWaveFile)

	model = load('C:\Users\shantanu\Desktop\MinorProject\Code\DATA\model.dat').model;

	new_n = 100;
	Data = zeros(1,13,new_n);
	
	[y fs opt] = wavread(BirdWaveFile);
	opt = mfccOptSet(fs);
	[mfcc yPreEmp] = wave2mfcc(y,fs,opt);
	Data(1,:,:) = highestEnergyFrame(mfcc);
	
	[predicted_label, accuracy, decision_values] = svmpredict(0, Data, model);
	predicted_label = GetBirdName(predicted_label);
	
end;

