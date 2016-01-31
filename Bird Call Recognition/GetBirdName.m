function name = GetBirdName(result)

	mapping = load('C:\Users\shantanu\Desktop\MinorProject\Code\BirdNameToIndexMap').mapping;
	name = ['a'];
	for i=1:size(result,1),
		s = mapping(result(i),:);
		name = [name ; s];
	end;

	name = name(2:end,:);
end;