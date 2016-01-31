function index = GetBirdIndex(result)

	mapping = load('C:\Users\shantanu\Desktop\MinorProject\Code\BirdNameToIndexMap\mapping.dat').mapping;
	index = zeros(size(result,1),1);
	for i=1:size(result,1),
		s = result(i,:);
		x = 0;
		for j=1:size(mapping,1),
			if mapping(j,:)==s,
				x = j;
				break;
			end;
		end;
		index(i) = x;
	end;

end;