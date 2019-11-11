FROM cibuilds/hugo:0.59
RUN apt update -y 
RUN apt install -y npm 
RUN npm install -g firebase-tools
