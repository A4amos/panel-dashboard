FROM ubuntu:24.04

WORKDIR /app

RUN apt-get update -y && apt-get upgrade -y && apt-get install nodejs npm -y

COPY package*.json ./

RUN npm ci

COPY . .

RUN npm run build

EXPOSE 4173

CMD ["npm", "run", "preview", "--", "--host", "0.0.0.0"]