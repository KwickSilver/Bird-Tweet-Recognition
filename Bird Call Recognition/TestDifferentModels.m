function x = TestDifferentModels

	i1 = [0];
	j1 = [0];
	e1 = [0];
	for i=3:4,
		for j=0:4,
			ChangeModel([cstrcat('-s ',int2str(i),' -t ',int2str(j))]);
			[a b c d e f] = CallRecognition;
			i1 = [i1 ; i];
			j1 = [j1 ; j];
			e1 = [e1;e];
		end;
	end;
	x = [i1(2:end) j1(2:end) e1(2:end)];
end;