NAME	= ajoergensen/irker

all	: build push

.built	: .
	 docker build --pull=true --force-rm=true -t $(NAME) .
	 @docker inspect -f '{{.Id}}' $(NAME) > .built

build	: .built

squash	: .built
	# docker save $(NAME) | sudo docker-squash -t stripped -verbose | docker load
	#@docker tag -f stripped $(NAME)
	@docker inspect -f '{{.Id}}' $(NAME) > .built

push	: .built
	 docker push $(NAME)

clean	:
	 @$(RM) .built
 
re	: clean all

.PHONY	: all build squash push
