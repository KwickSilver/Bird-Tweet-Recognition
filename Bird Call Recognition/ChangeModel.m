function ChangeModel(options)

	%delete('C:\Users\shantanu\Desktop\MinorProject\Code\DATA\model.dat');
	features = load('C:\Users\shantanu\Desktop\MinorProject\Code\DATA\train.dat').features;
	result = load('C:\Users\shantanu\Desktop\MinorProject\Code\DATA\train_output.dat').result;
	
	result1 = GetBirdIndex(result);
	model = svmtrain(result1*1.0, features , options);
	save('C:\Users\shantanu\Desktop\MinorProject\Code\DATA\model.dat','model');
	
end;