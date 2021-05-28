docker run --name dendrite \
	-p 80:8008 \
	-p 443:8448 \
	-v $PWD/data:/opt \
	-d dendrite:0.3.11
