function BirdMapping(BirdDirs)

	mapping = ['a'];
	
	DataFolderPath = 'C:\Users\shantanu\Desktop\MinorProject\Code\BirdNameToIndexMap';
	DataFolder = dir(DataFolderPath);
	DataFiles = {DataFolder.name};

	if size(DataFiles,2)==3,
		mapping = [mapping ; load('C:\Users\shantanu\Desktop\MinorProject\Code\BirdNameToIndexMap\mapping.dat').mapping];
	end;
	
	for i=3:size(BirdDirs,2),
		flag = 0;
		for j=1:size(mapping,2),
			if mapping(j)==BirdDirs{i},
				flag = 1;
				break;
			end;
		end;
		if flag==0,
			mapping = [mapping;BirdDirs{i}];
		end;
	end;
	mapping = mapping(2:end,:);
	save('C:\Users\shantanu\Desktop\MinorProject\Code\BirdNameToIndexMap\mapping.dat','mapping');
	
end;