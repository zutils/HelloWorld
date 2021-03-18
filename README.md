# HelloWorld

[![CircleCI](https://circleci.com/gh/zutils/HelloWorld.svg?style=svg)](https://circleci.com/gh/zutils/HelloWorld)

The Hello World is a capstone project for the Udacity AWS Cloud Devops Engineer class. It's purpose is to prove continuous development and continuous integration with Circleci.

All files necessary for deployment, including AWS cloudformation, kubernetes, and circleci configuration files are in the ./circleci/ directory

The Hello World server is a simple server that returns a Hello World text when accessed by the server. If the server is running, you can access it with http://44.242.101.111/.  

This project is special as when any modifications to the source code are made to the 'main' branch of this repo, a docker container with this image will be created, and the application will deploy automatically.


Steps to run:
1) Modify this source code
2) Push code to the 'main' branch
3) Wait just over 5 minutes
4) Access http://44.242.101.111/ with a web browser