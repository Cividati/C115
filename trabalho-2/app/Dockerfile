FROM node

RUN mkdir /root/app
COPY ./calculadora /root/app

WORKDIR /root/app

RUN npm install express

EXPOSE 80
CMD [ "npm", "start" ]