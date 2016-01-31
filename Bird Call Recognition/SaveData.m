function SaveData(option)
	
	[features result BirdsDirs] = featuresExtract('C:\Users\shantanu\Desktop\MinorProject\Code\Test Set');
	
	BirdMapping(BirdsDirs);
	save('C:\Users\shantanu\Desktop\MinorProject\Code\DATA\test.dat','features');
	save('C:\Users\shantanu\Desktop\MinorProject\Code\DATA\test_output.dat','result');
	
	[features result BirdsDirs] = featuresExtract('C:\Users\shantanu\Desktop\MinorProject\Code\Training Set');
	
	BirdMapping(BirdsDirs);
	save('C:\Users\shantanu\Desktop\MinorProject\Code\DATA\train.dat','features');
	save('C:\Users\shantanu\Desktop\MinorProject\Code\DATA\train_output.dat','result');
	
	result = GetBirdIndex(result);
	model = svmtrain(result*1.0, features , option);
	save('C:\Users\shantanu\Desktop\MinorProject\Code\DATA\model.dat','model');

end;