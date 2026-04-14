#!/bin/bash

<<task

Deploy the Django app and handle the code for the error

task

# 🔥 animation function
loading(){
    for i in {1..3}
    do
        echo -n "."
        sleep 0.5
    done
    echo ""
}

code_clone(){
        echo "Cloning the django app"
        git clone https://github.com/rajcharanthecoder/django-notes-app.git


}

install_requirements(){
        echo "Installing dependenices"
        sudo apt-get update
        sudo apt-get install nginx -y docker-compose

}

required_restarts(){
	chown $USER /var/run/docker.sock
        sudo systemctl restart nginx && sudo systemctl enable nginx
	systemctl restart docker
}

deploy(){
        docker build -t notes-app .
        #docker run -d -p 8000:8000 notes-app:latest
	docker-compose up -d 
}

echo -n "🚀 Deployment started"
loading

if ! code_clone; then
	echo "the code directory already exists"
	cd django-notes-app
fi

if ! install_requirements; then
	echo "Installation Failed"
	exit 1
fi
if ! required_restarts; then
	echo "System Fault Identified"
	exit 1
fi
if ! deploy; then
	echo "Deployment failed , mailing the admin"
	#sendmail utlity
	exit 1
fi

echo -n "✅ Deployment completed"
loading
