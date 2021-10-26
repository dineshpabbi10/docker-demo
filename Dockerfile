FROM node:14

WORKDIR "/user/src/app"

COPY . .

RUN npm install

EXPOSE 8080

CMD ["npm","run","serve"]