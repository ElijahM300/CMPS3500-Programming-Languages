all: circleA circleinputB arrayD reversearrayD neat

circleA:
	$(info *)
	$(info ************ Running circleA.f ************)
	$(info )
	gfortran -o circleA circleA.f
	./circleA

circleinputB:
	$(info )
	$(info *)
	$(info ************ Running circleinputB.f ************)
	$(info )
	gfortran -o circleinputB circleinputB.f
	./circleinputB

arrayD:
	$(info )
	$(info *)
	$(info ************ Running arrayD.f ************)
	$(info )
	gfortran -o arrayD arrayD.f
	./arrayD
	
reversearrayD:
	$(info )
	$(info *)
	$(info ************ Running reversearrayD.f ************)
	$(info )
	gfortran -o reversearrayD reversearrayD.f
	./reversearrayD

neat:
	$(info )
	$(info *)
	$(info ************ Running neat.f ************)
	$(info )
	gfortran -o neat neat.f
	./neat

clean:
	rm -f circleA circleinputB arrayD reversearrayD neat
