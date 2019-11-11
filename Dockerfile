FROM node:latest

RUN apt update -y
RUN apt install -y hugo

RUN npm install -g firebase-tools
