FROM node:0.10.38

RUN apt-get update -qq && apt-get install -y build-essential

RUN mkdir /src
WORKDIR /src

ADD app/package.json /src/package.json
RUN npm install

VOLUME ["app:/src/app"]

EXPOSE 3000

CMD ["npm", "start"]
