FROM node:alpine

WORKDIR '/app'

COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# specifying a new "FROM" statement lets docker know that a new "block" is about to run
FROM nginx
COPY --from=0 /app/build /usr/share/nginx/html