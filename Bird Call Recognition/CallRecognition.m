function [features result model predicted_label accuracy decision_values] = CallRecognition

	DataFolderPath = 'C:\Users\shantanu\Desktop\MinorProject\Code\DATA';
	DataFolder = dir(DataFolderPath);
	DataFiles = {DataFolder.name};

	if size(DataFiles,2)!=7,
		%for j = 3:size(DataFiles,2),
		%	delete(strcat(DataFolderPath,'\',DataFiles{j}));
		%end;
		
		SaveData(['-s 0 -t 0']);
	end;

	features = load('C:\Users\shantanu\Desktop\MinorProject\Code\DATA\test.dat').features;
	result = load('C:\Users\shantanu\Desktop\MinorProject\Code\DATA\test_output.dat').result;
	result1 = GetBirdIndex(result);
	model = load('C:\Users\shantanu\Desktop\MinorProject\Code\DATA\model.dat').model;
	[predicted_label1, accuracy, decision_values] = svmpredict(result1*1.0, features, model);
	%[predicted_label] = svmpredict(result*1.0 - '0', features*1.0 - '0', model , ['libsvm_options']);
	
	accuracy = accuracy(1);
	predicted_label = GetBirdName(predicted_label1);

end;