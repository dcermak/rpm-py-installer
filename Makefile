SERVICE ?= fedora_rawhide

default : build test
.PHONY : default

# Ex. make build SERVICE=fedora28
build :
	docker-compose build --force-rm $(SERVICE)
.PHONY : build

# Ex. make test SERVICE=fedora28
test :
	docker-compose run --rm $(SERVICE)
.PHONY : test

# Ex. make login SERVICE=fedora28
login :
	docker run -it rpm-py-installer_$(SERVICE) bash
.PHONY : login

no-network-test :
	pytest -m 'not network'
.PHONY : no-network-test

clean :
	docker system prune -a -f
.PHONY : clean