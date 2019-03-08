FROM node:alpine as builder
WORKDIR '/app'
COPY ./package.json ./
RUN npm install
<<<<<<< HEAD
=======
RUN npm cache clean --force
RUN npm install bootstrap
>>>>>>> origin/master
COPY . .
RUN npm run build

FROM nginx
EXPOSE 3000
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf
<<<<<<< HEAD
COPY --from=builder /app/build /usr/share/nginx/html
=======
COPY --from=builder /app/build /usr/share/nginx/html
>>>>>>> origin/master
