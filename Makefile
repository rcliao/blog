start:
	hugo server --bind=167.71.112.120 -b 167.71.112.120 -D

new:
	hugo new

deploy:
	./script/deploy.sh
